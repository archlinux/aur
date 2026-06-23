# Maintainer: Simon Pintarelli <simon.pintarelli@cscs.ch>
# Contributor: Anton Kudelin <kudelin at proton dot me>

pkgname=costa
_pkgname=COSTA
pkgver=2.3.2
pkgrel=1
pkgdesc="Communication-optimal shuffle and transpose algorithms."
arch=(x86_64 aarch64)
url="https://github.com/eth-cscs/COSTA"
license=(BSD-3-Clause)
depends=(openmpi gcc-libs glibc scalapack)
makedepends=(cmake)
provides=(costa)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('2beb8b30ab641693094efe0015e5cb7393c25cef4753deb67493e17d05f9a797')

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$_pkgname-$pkgver \
    -DBUILD_SHARED_LIBS=On \
    -DCOSTA_SCALAPACK=CUSTOM \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm755 ../$_pkgname-$pkgver/LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
