# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=tryton
pkgver=5.4.1
_pkgdir=5.4
pkgrel=1
pkgdesc="A three-tiers high-level general purpose application platform (client application)"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5' 'python-cairo' 'python-dateutil' 'python-pygobject-stubs' 'pygobject-devel')
makedepends=('python-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$pkgname-$pkgver.tar.gz"
        "http://downloads.tryton.org/$_pkgdir/$pkgname-$pkgver.tar.gz.asc"
        'tryton.desktop'
        'tryton-icon.png')
sha256sums=('adeb3b391b6421ff3f9279208e00c96920a70eb8364217c312cc1392363e6452'
         'SKIP'
         '78378206bbd3264cbcf23e2836e4bbb70ad1ea643c4db71dccf997ff2fb06443'
         'SKIP')
validpgpkeys=('7C5A4360F6DF81ABA91FD54D6FF50AFE03489130') # Cédric Krier

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/tryton-icon.png $pkgdir/usr/share/pixmaps/tryton/tryton-icon.png
}
