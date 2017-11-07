#Maintainer: David McInnis <davidm@eagles.ewu.edu>

pkgname=python-mahotas
shrtname=mahotas
pkgver=1.4.4
pkgrel=1
pkgdesc="A fast computer vision algorithms (all implemented in C++) operating over numpy arrays"
url="http://luispedro.org/software/mahotas"
depends=('python' 'python-numpy')
makedepends=('python-numpydoc' )
checkdepends=('python-scipy' 'python-imread' 'python-nose' 'python-pillow')
license=('MIT')
arch=('i686' 'x86_64')
source=("${pkgname}-${pkgver}.zip::https://github.com/luispedro/mahotas/archive/v${pkgver}.zip")
sha256sums=('ee8dc75e17956660c45dccef1d82326af2ed35ac598439522da9b051afe92202')

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
