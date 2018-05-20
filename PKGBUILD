# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=spivak
pkgver=1.2
pkgrel=1
pkgdesc="Karaoke player based on GStreamer and Qt5"
arch=(x86_64)
url="https://github.com/gyunaev/spivak"
license=(GPL3)
depends=(gst-plugins-base libzip qt5-base uchardet)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gyunaev/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5ea13118d64ffa7206005601fa505b5d06692238091166111edcf7881d94f509')

prepare() {
	cd $pkgname-$pkgver
	sed -i '/SUBDIRS += languagedetector/d' plugins/plugins.pro
}

build() {
	cd $pkgname-$pkgver
	qmake
	make
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 src/spivak "$pkgdir/usr/bin/spivak"
	install -Dm644 packaging/spivak.desktop "$pkgdir/usr/share/applications/spivak.desktop"
	install -Dm644 packaging/icon.png "$pkgdir/usr/share/pixmaps/spivak.png"
}
