# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="osslsigncode"
pkgver="2.5"
pkgrel="1"
pkgdesc="OpenSSL based Authenticode signing for PE/MSI/Java CAB files"
arch=('i686' 'x86_64')
url="https://github.com/mtrojnar/osslsigncode"
license=('GPL')
depends=('curl' 'openssl')
makedepends=('cmake')
source=("https://github.com/mtrojnar/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('b50a7c8a8fb6668e999d9e63a931e5888c31f202ca539b62a385be6bacb03c2d25ac5fabd660c779817f0ebea14e9dfe05cdcb180c1cd25f818c07c28ebd88ce')

prepare() {
  cmake \
    -B build -S "$srcdir/osslsigncode-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cmake --build build
}

check() {
  cd build
  ctest Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
