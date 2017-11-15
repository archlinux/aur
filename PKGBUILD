# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gpx-viewer
pkgver=0.4.0
pkgrel=1
pkgdesc="Simple tool to visualize tracks and waypoints stored in a gpx file"
arch=('x86_64')
url="https://blog.sarine.nl/tag/gpxviewer/"
license=('GPL')
depends=('gdl' 'libchamplain')
makedepends=('intltool')
source=("https://launchpad.net/gpx-viewer/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        "gpx-viewer-0.4.0-gtk3-bugfix.patch")
sha256sums=('956acfaf870ac436300cd9953dece630df7fd7dff8e4ae2577a6002884466f80'
            'c74e9db587720ac03a295872909e4aab9e40d4f044cfbee735b32d1998ed78d9')

prepare() {
	cd $pkgname-$pkgver
	patch -Np0 -i ../gpx-viewer-0.4.0-gtk3-bugfix.patch
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --disable-database-updates
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
