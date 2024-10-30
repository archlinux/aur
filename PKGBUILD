# Maintainer: Cyan903 <cyanp0515 at gmail dot com>

pkgname="xswm-git"
pkgver=r159.d53f38b
pkgrel=1
pkgdesc="Minimal X-window-manager with only one task. Open every window maximized."
arch=("x86_64")
url="https://github.com/astier/xswm"
license=("MIT")
depends=("libx11")
makedepends=("git" "make")
provides=("xswm")
conflicts=("xswm")
source=("$pkgname::git+$url.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-VCS}" || exit 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-VCS}" || exit 1
	make xswm
}

package() {
	cd "$srcdir/${pkgname%-VCS}" || exit 1

	install -Dm755 "./xswm" "$pkgdir/usr/bin/xswm"
	install -Dm644 "./README.md" "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "$srcdir/.." || exit 1

	install -Dm644 "./xswm.desktop" "$pkgdir/usr/share/xsessions/xswm.desktop"
}
