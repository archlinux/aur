# Maintainer: nandub <nandub+arch@nandub.info>
# Contributor: Kim Walisch <kim.walisch@gmail.com>

pkgname=primesum
pkgver=1.7
pkgrel=1
pkgdesc="Sum of the primes below x"
url="https://github.com/kimwalisch/primesum"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kimwalisch/primesum/archive/v${pkgver}.tar.gz")
sha1sums=('84f50b96070a96e59b5208eef1e1463d985a7087')
arch=('x86_64')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_SHARED_LIBS=ON .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
