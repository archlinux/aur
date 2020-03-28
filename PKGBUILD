# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: James Barnett < james at wbarnett dot us >

pkgname=avogadroapp
pkgver=1.93.0
pkgrel=2
pkgdesc="An advanced molecular editor"
arch=('x86_64')
url="http://www.openchemistry.org/projects/avogadro2/"
license=('BSD')
depends=('avogadrolibs')
optdepends=('openbabel: Open Babel plugin actions')
makedepends=('cmake' 'eigen')
provides=('avogadro2')
source=("https://github.com/OpenChemistry/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8cf913058aff58fe588531618a680d82401fbfe3f21e4783a44979f4a2dd5586')

build() {
  mkdir -p "$srcdir/build"
  cd $srcdir/build
  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 "$srcdir/$pkgname-$pkgver/LICENSE" \
  "$pkgdir/usr/share/licenses/$pkgname"
}
