# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: James Barnett < james at wbarnett dot us >

pkgname=avogadroapp
pkgver=1.99.0
pkgrel=2
pkgdesc="An advanced molecular editor"
arch=('x86_64')
url="https://two.avogadro.cc"
license=('BSD-3-Clause')
depends=('avogadrolibs-qt5' 'python-cclib' 'vtk' 'qt5-x11extras' 'pugixml'
         'utf8cpp' 'fmt')
optdepends=('openbabel: Open Babel plugin actions')
makedepends=('cmake' 'eigen' 'git')
provides=('avogadro2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenChemistry/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('4713faa4e755433947924a381fd1631dfe46a9f27065765cfa04c120ed603189')

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
