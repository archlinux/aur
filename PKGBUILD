# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-chrome
pkgver=0.9.5
pkgrel=1
epoch=1
pkgdesc="A special compilation of curl that makes it impersonate Chrome"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=(tar gcc cmake go ninja unzip zlib autoconf automake libtool patch)
depends=(nss libc++)
provides=(libcurl-impersonate-chrome)
conflicts=(curl-impersonate-bin)

source=(
  "curl-impersonate.tar.gz::https://github.com/lexiforest/curl-impersonate/archive/refs/tags/v${pkgver}.tar.gz"
)

md5sums=('7055f38f0bf8b219ecab131d21de4fa2')

build () {
  export CXXFLAGS+=" -Wno-error=stringop-overflow"
  cd curl-impersonate-${pkgver}
  autoconf
  mkdir -p build
  cd build
  ../configure --prefix="${pkgdir}/usr"
  make chrome-build -j1
}

package () {
  mkdir -p "${pkgdir}/usr"
  cd curl-impersonate-${pkgver}/build
  make chrome-install
}
