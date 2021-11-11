# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: James Barnett < james at wbarnett dot us >

pkgname=avogadroapp
pkgver=1.95.1
pkgrel=4
pkgdesc="An advanced molecular editor"
arch=('x86_64')
url="https://two.avogadro.cc"
license=('BSD')
depends=('avogadrolibs-qt5' 'python-cclib' 'vtk' 'qt5-x11extras' 'pugixml'
         'utf8cpp' 'fmt')
optdepends=('openbabel: Open Babel plugin actions')
makedepends=('cmake' 'eigen')
provides=('avogadro2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenChemistry/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d59694a6b32bb95317c66f4c806fe05d46e7e3ca4e594aa214bf9dd7e179b317')

build() {
  mkdir -p "$srcdir/build"
  cd $srcdir/build
  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_VTK=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 "$srcdir/$pkgname-$pkgver/LICENSE" \
  "$pkgdir/usr/share/licenses/$pkgname"
}
