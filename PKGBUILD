# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=didjvu
pkgver=0.9
pkgrel=1
pkgdesc='DjVu encoder with foreground/background separation'
arch=(any)
url='http://jwilk.net/software/didjvu'
license=(GPL2)
depends=('python2>=2.7'
         'gamera>=3.3.2'
         'python2-pillow'
         'djvulibre>=3.5.22'
         'minidjvu>=0.8'
         'libgexiv2>=0.10.3'
	 'python2-gobject')
checkdepends=(python2-nose)
source=("https://github.com/jwilk/didjvu/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/jwilk/didjvu/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.asc")
validpgpkeys=(CDB5A1243ACDB63009AD07212D4EB3A6015475F5)
sha256sums=('7b5dc4ce14c17d1f0442b4c9b266253f3b83e5940f89fc033e114ed1d0b4d977'
            'SKIP')

build() {
        cd "$srcdir/$pkgname-$pkgver"
	/usr/bin/make PYTHON=/usr/bin/python2 PREFIX=/usr
}

check() {
        cd "$srcdir/$pkgname-$pkgver"
	/usr/bin/make PYTHON=/usr/bin/python2 PREFIX=/usr test
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
	/usr/bin/make PYTHON=/usr/bin/python2 PREFIX=/usr DESTDIR="$pkgdir" install
}
