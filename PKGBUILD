# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Yann Leprince <yann dot leprince at ylep dot fr>

pkgname=blitz
pkgver=1.0.2
pkgrel=1
pkgdesc="C++ Class library for scientific computing"
arch=('x86_64')
url="https://github.com/blitzpp/blitz"
# The user is free to choose the license among ('Artistic2.0' 'BSD' 'LGPL3'),
# but we cannot express it here so we only mention the most permissive.
license=('BSD')
depends=('boost')
makedepends=('cmake' 'python')
conflicts=('blitz-cppqed-hg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/blitzpp/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('195873ba25ae4c10b9cd374bf42c67c2')


build() {
  local _conditional_options
  cd "$pkgname-$pkgver"

  mkdir -p build
  cd build


  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DCMAKE_ENABLE_SERIALISATION=ON \
    ..

  make LDFLAGS="$LDFLAGS" lib
}

#check() {
#  cd "$pkgname-$pkgver/build"
#  make -k check-testsuite
#}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install

  cd ..
  install -D -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
