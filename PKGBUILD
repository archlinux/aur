pkgname=lyriek
pkgver=0.1.0
pkgrel=1
arch=('x86_64' 'i686')
url="https://gitlab.com/bartwillems/lyriek"
license=('GPL3')
depends=('dbus' 'gtk3')
makedepends=('rust' 'cargo' 'git' 'desktop-file-utils')
conflicts=('lyriek-git')
source=("https://gitlab.com/bartwillems/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d9d359554fcf8a1dd21f7556a953b4949616c69c536f36d106f1193358e9525b')

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
