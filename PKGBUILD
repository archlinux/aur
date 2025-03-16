# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-firefox
pkgver=0.9.5
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

md5sums=('7055f38f0bf8b219ecab131d21de4fa2')

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
