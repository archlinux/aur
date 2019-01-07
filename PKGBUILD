# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=spivak
pkgver=1.4
pkgrel=1
pkgdesc="Karaoke player based on GStreamer and Qt5"
arch=(x86_64)
url="https://github.com/gyunaev/spivak"
license=(GPL3)
depends=(gst-plugins-base libzip qt5-base uchardet)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gyunaev/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e64a5d46ed6cfb5ed0c6fcb46a956155a28dd75b87a5de9394d69ec593aa7859')

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
