# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=tryton
pkgver=5.8.2
_pkgdir=5.8
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
sha256sums=('901770c4ebde89c82c4d9b47d492a31bdde2efad93fad2924aeb355aebb3254f'
            'SKIP'
            '78378206bbd3264cbcf23e2836e4bbb70ad1ea643c4db71dccf997ff2fb06443'
            'ef2440c3f8f905e8636a07e5d032939bbf835b25bc7e998482cbbf4c78878831')
b2sums=('93c589d731d1dbea686e390218cc5076952dcee76376068dd0ad3612273f1f035ab386d835f2a4e5f6170f64aa86683273c54aeb012fc17e0cf71b5e8e553e73'
        'SKIP'
        '7bc3ca915f022cbd120fb93d085502325e0a69415884553dead86720ac976438352f3bd9334400cb1c4827bda64c9749695447d64f22848ae4d517c373154ea3'
        'cd34fb947aa6e02a2d0b805444b12b122caf20aa7d67428b609b21f71f86ce1dee0311eba42cbca8467eb5d90bde45c2e6b287fd0661253cc180028d4a7d5676')
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
