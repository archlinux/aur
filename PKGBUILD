# Maintainer: nandub <nandub+arch@nandub.info>
# Contributor: Kim Walisch <kim.walisch@gmail.com>

pkgname=primesieve
pkgver=7.5
pkgrel=1
pkgdesc="A fast prime number generation program and C/C++ library"
url="https://github.com/kimwalisch/primesieve"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kimwalisch/primesieve/archive/v${pkgver}.tar.gz")
sha1sums=('2e21e8bfa27aec1bc7b7abcd6e81c12f208412e9')
arch=('x86_64')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_STATIC_LIBS=OFF .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
