pkgname=lyriek
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'i686')
url="https://gitlab.com/bartwillems/lyriek"
license=('GPL3')
depends=('dbus' 'gtk3')
makedepends=('rust' 'cargo' 'git' 'desktop-file-utils')
conflicts=('lyriek-git')
source=("https://github.com/BartWillems/lyriek/archive/$pkgver.tar.gz")
sha256sums=('7a08962a32ee59443069c4ae5d386cd82e2a7ea950789c8b0eb1c9df3a7b568c')

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

