# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=ampl-asl
_gitcommit=ae937db9bd1169ec2c4cb8d75196f67cdcb8041b
pkgver=20241122
pkgrel=1
pkgdesc="AMPL Solver Library"
arch=(x86_64)
url="https://github.com/${pkgname/-//}"
license=(BSD-3-Clause)
depends=(openmp)
makedepends=(cmake git)
source=("git+${url}#commit=${_gitcommit}")
sha512sums=('e750e5f38c3f13dfe7a56c4be62ab7dc0bdba451263fb8ad3a92be60ab7e81bfa3e8c2c6e8abbf259b80bbe86f284e946cc15470fb6f84114b485b1b00db1d62')

build() {
  cmake \
    -S asl \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=1 \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 asl/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
