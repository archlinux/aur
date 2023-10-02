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
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_STATIC_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname-$pkgver/README.md -t "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 $pkgname-$pkgver/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
