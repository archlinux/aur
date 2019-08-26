pkgname=lyriek-git
pkgver=0.1.0.18.g15d1373
pkgrel=1
arch=('x86_64' 'i686')
url="https://gitlab.com/bartwillems/lyriek"
license=('GPL3')
depends=('gtk3')
makedepends=('rust' 'cargo' 'git' 'desktop-file-utils')
source=("lyriek::git+https://gitlab.com/bartwillems/lyriek.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/lyriek"
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/lyriek"
	cargo build --release
}

package() {
	cd "$srcdir/lyriek"
	
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "extras/lyriek.desktop"
	install -D -m755 "target/release/lyriek" "$pkgdir/usr/bin/lyriek"
	install -D -m644 "assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/lyriek.svg"
}
