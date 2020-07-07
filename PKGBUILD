# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gpx-viewer
pkgver=0.4.0
pkgrel=4
pkgdesc="Simple tool to visualize tracks and waypoints stored in a gpx file"
arch=('x86_64')
url="https://blog.sarine.nl/tag/gpxviewer/"
license=('GPL')
depends=('gdl' 'libchamplain')
makedepends=('intltool')
source=("https://launchpad.net/gpx-viewer/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        "gpx-viewer.appdata.xml"
        "gpx-viewer-0.4.0-gtk3-bugfix.patch")
sha256sums=('956acfaf870ac436300cd9953dece630df7fd7dff8e4ae2577a6002884466f80'
            '0619d033d3a08292e67d261b09b0674cb17343d6a35b0c0f747e8604b9f56a88'
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
	install -Dm644 ../gpx-viewer.appdata.xml "$pkgdir/usr/share/metainfo/gpx-viewer.appdata.xml"
}
