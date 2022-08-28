# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: James Barnett < james at wbarnett dot us >

pkgname=avogadro2
_pkgname=avogadroapp
pkgver=1.97.0
pkgrel=1
pkgdesc="An advanced molecular editor. https://doi.org/10.1186/1758-2946-4-17"
arch=('x86_64')
url="https://two.avogadro.cc"
license=('BSD')
depends=('avogadrolibs-qt5' 'python-cclib' 'vtk' 'qt5-x11extras' 'pugixml'
         'utf8cpp' 'fmt')
optdepends=('openbabel: Open Babel plugin actions')
makedepends=('make' 'cmake' 'eigen' 'git')
provides=('avogadro2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenChemistry/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('c4e1a0d54e43c2ae8bbd6b872e46b2f983f45c5aaa981731c681d5325faaec63')

build() {
  mkdir -p "$srcdir/build"
  cd $srcdir/build
  cmake "$srcdir/$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
       -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DENABLE_TESTING=OFF \
      -DUSE_VTK=OFF \
      "${srcdir}/${_pkgname}-$pkgver"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/licenses/_$pkgname"
  install -m755 "$srcdir/$_pkgname-$pkgver/LICENSE" \
  "$pkgdir/usr/share/licenses/$_pkgname"
}
