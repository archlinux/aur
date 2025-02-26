# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-firefox
pkgver=0.9.3
pkgrel=1
pkgdesc="A special compilation of curl that makes it impersonate Firefox"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=(tar cmake go ninja unzip zlib autoconf automake libtool python mercurial gyp patch)
depends=(nss)
provides=(curl-impersonate-firefox libcurl-impersonate-firefox)

# WORKAROUND for building brotli
options=("!buildflags")

source=(
  "curl-impersonate.tar.gz::https://github.com/lexiforest/curl-impersonate/archive/refs/tags/v${pkgver}.tar.gz"
)

md5sums=('1d24ca623d799d613afd55e2d652407e')

build () {
  cd curl-impersonate-${pkgver}
  autoconf
  mkdir -p build
  cd build
  ../configure --prefix="${pkgdir}/usr"
  make firefox-build
}

package () {
  mkdir -p "${pkgdir}/usr"
  cd curl-impersonate-${pkgver}/build
  make firefox-install
}
