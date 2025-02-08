# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: James Barnett < james at wbarnett dot us >

pkgname=avogadroapp
pkgver=1.100.0
pkgrel=1
pkgdesc="An advanced molecular editor"
arch=('x86_64')
url="https://two.avogadro.cc"
license=('BSD-3-Clause')
depends=('avogadrolibs-qt5' 'vtk' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'eigen' 'python-cclib' 'pugixml' 'utf8cpp' 'fmt' 'nlohmann-json' 'fast_float')
optdepends=('openbabel: Open Babel plugin actions')
provides=('avogadro2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenChemistry/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8d73f5d24883ebe1a6ca54e13cf70aaf8125174190aa028e1e0ef48b95bd6b0b')

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

