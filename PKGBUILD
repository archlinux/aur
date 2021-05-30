# Merged with official ABS kdsoap-ws-discovery-client PKGBUILD by João, 2021/02/18 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kdsoap-ws-discovery-client-git
pkgver=0_r62.gdcefb65
pkgrel=1
pkgdesc='WS-Discovery client library based on KDSoap'
license=(GPL3 custom)
arch=($CARCH)
url='https://caspermeijn.gitlab.io/kdsoap-ws-discovery-client/'
depends=(kdsoap-git)
makedepends=(git extra-cmake-modules-git doxygen qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/caspermeijn/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo "0_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir"/${pkgname%-git}/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname
}
