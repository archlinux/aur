# Maintainer: stag-enterprises < x [at] stag [dot] lol >

pkgname=gitbutler-cli-bin
pkgver=0.19.9
pkgrel=1
pkgdesc="Git client with things like parallel and stacked branches, just the CLI"
arch=("x86_64" "aarch64")
depends=("dbus" "zlib-ng-compat" "gcc-libs")
url="https://gitbutler.com/"
license=("LicenseRef-FSL-1.1-MIT")
changelog="CHANGELOG"
source=("pkg-license.md")
# TODO figure out how 2990 is calculated
source_x86_64=("https://releases.gitbutler.com/releases/release/0.19.9-2990/linux/x86_64/but")
source_aarch64=("https://releases.gitbutler.com/releases/release/0.19.9-2990/linux/aarch64/but")
sha256sums=('2a3154bf44e0b219014291b96249082f3305844a1d73796741468c8128c2829e')
sha256sums_x86_64=('722a9ece8cdd8699a17b3d541c532a63cf648c22d0fb77b14c35a3492061bdb2')
sha256sums_aarch64=('722a9ece8cdd8699a17b3d541c532a63cf648c22d0fb77b14c35a3492061bdb2')

build() {
	cd "$srcdir"
	chmod +x ./but
	./but completions bash   >but.bash
	./but completions zsh    >but.zsh
	./but completions fish   >but.fish
	./but completions elvish >but.elv
}

package() {
	cd "$srcdir"
	install -Dm755 but            "$pkgdir/usr/bin/but"
	install -Dm644 pkg-license.md "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE.md"
	install -Dm644 but.bash       "$pkgdir/usr/share/bash-completion/completions/but"
	install -Dm644 but.zsh        "$pkgdir/usr/share/zsh/site-functions/_but"
	install -Dm644 but.fish       "$pkgdir/usr/share/fish/vendor_completions.d/but.fish"
	install -Dm644 but.elv        "$pkgdir/usr/share/elvish/lib/but.elv"
}
