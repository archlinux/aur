pkgname=lyriek
pkgver=0.2.1
pkgrel=1
arch=('x86_64' 'i686')
url="https://gitlab.com/bartwillems/lyriek"
license=('GPL3')
depends=('dbus' 'gtk3')
makedepends=('rust' 'cargo' 'git' 'desktop-file-utils')
conflicts=('lyriek-git')
source=("https://github.com/BartWillems/lyriek/archive/$pkgver.tar.gz")
sha256sums=('a5d048248a1575bf3d15e69f12128bf30b38b47deacea7d820504182c433a6a2')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	pkgdesc="A multi-threaded GTK application to fetch lyrics of currently playing songs"
	provides=('lyriek')

	cd "$srcdir/$pkgname-$pkgver"
	
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "extras/lyriek.desktop"
	install -D -m755 "target/release/lyriek" "$pkgdir/usr/bin/lyriek"
	install -D -m644 "assets/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/lyriek.svg"
}

