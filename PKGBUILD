#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname=python-mahotas
shrtname=mahotas
pkgver=1.4.5
pkgrel=1
pkgdesc="A fast computer vision algorithms (all implemented in C++) operating over numpy arrays"
url="http://luispedro.org/software/mahotas"
depends=('python' 'python-numpy')
makedepends=('python-numpydoc' )
checkdepends=('python-scipy' 'python-imread' 'python-nose' 'python-pillow')
license=('MIT')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.zip::https://github.com/luispedro/mahotas/archive/v${pkgver}.zip")
sha256sums=('e8be9f106c3258ae76bd748a331721289fd8c70183c16f444d7e5376aef7c794')

build() {
    cd $srcdir/$shrtname-$pkgver
    python setup.py build
}

check() {
    cd $srcdir/$shrtname-$pkgver
    python setup.py test
}

package() {
    cd $srcdir/$shrtname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -m755 -d "${pkgdir}/usr/share/licenses/python-mahotas"
    install -m644 COPYING "${pkgdir}/usr/share/licenses/python-mahotas/LICENSE.txt"
}
