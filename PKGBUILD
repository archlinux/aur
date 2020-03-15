# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: LinArcx <linarcx at gmail.com>
pkgname=kindd
pkgver=2.1.0
pkgrel=1
pkgdesc="A Kindful dd GUI written in Qt Quick"
arch=('any')
url="https://github.com/LinArcX/Kindd"
license=('GPL3')
depends=('polkit' 'qt5-quickcontrols' 'qt5-quickcontrols2'
         'qt5-graphicaleffects' 'qt5-svg' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e596f1b1577ff3e83a779e6181252ae2f09731f513d17dd6b95cbc2cf204654f')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake ..
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "build/core/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 "assets/appconf/$pkgname.desktop" -t \
		"$pkgdir/usr/share/applications"
	install -Dm644 "assets/appconf/$pkgname.svg" -t \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps"
}

