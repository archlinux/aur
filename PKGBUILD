# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=didjvu
pkgver=0.8
pkgrel=2
pkgdesc='DjVu encoder with foreground/background separation'
arch=(any)
url='http://jwilk.net/software/didjvu'
license=(GPL2)
depends=('python2>=2.6'
         'gamera>=3.2.3'
         'python2-pillow'
         'djvulibre>=3.5.22'
         'minidjvu>=0.8'
         'python2-configargparse'
         'libgexiv2>=0.10.3'
         'python2-gobject')
source=("https://pypi.python.org/packages/source/d/didjvu/$pkgname-$pkgver.tar.gz"
        "https://pypi.python.org/packages/source/d/didjvu/$pkgname-$pkgver.tar.gz.asc"
        didjvu-setup.patch)
md5sums=(4cc6bbd2c938fbc4b950f68d7c724763
         SKIP
         afdb2ca65868a1fdbcd4a2060eea2145)
validpgpkeys=(CDB5A1243ACDB63009AD07212D4EB3A6015475F5)

build() {
        cd "$srcdir/$pkgname-$pkgver"
        /usr/bin/python2 setup.py build
}

check() {
        cd "$srcdir/$pkgname-$pkgver"
        /usr/bin/python2 setup.py check
}

package() {
        cd "$srcdir"
        for p in *.patch ; do patch -p0 -i $p ; done
        cd "$pkgname-$pkgver"
        /usr/bin/python2 setup.py install --root="$pkgdir" --prefix=/usr
}
