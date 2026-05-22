# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>

pkgname=nsproxy
pkgver=0.5.2
pkgrel=1
pkgdesc='A command-line tool that force applications to use a specific SOCKS5 or HTTP proxy.'
url="https://github.com/nlzy/${pkgname}"
license=('GPL-2.0-or-later')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('3bd96cc0f1675ba6523928cbe7fc3bbfd037faba79572b2421fbfa01ae22d6f5')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('cmake' 'linux-api-headers')

build() {
  export CFLAGS=$(echo "${CFLAGS}" | sed 's/ -Wp,-D_FORTIFY_SOURCE=[^ ]\+ / /')
  export CXXFLAGS=$(echo "${CXXFLAGS}" | sed 's/ -Wp,-D_FORTIFY_SOURCE=[^ ]\+ / /')
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  cmake --build build
}

package() {
  cmake --install build
}
