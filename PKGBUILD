# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-firefox
pkgver=v0.4.1
pkgrel=1
pkgdesc="A special compilation of curl that makes it impersonate Firefox"
url="https://github.com/lwthiker/curl-impersonate"
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=(tar cmake go ninja unzip zlib autoconf automake libtool python mercurial gyp patch)
depends=(nss)
provides=(curl-impersonate-firefox)

# WORKAROUND for building brotli
options=("!buildflags")

source=(
  "curl-impersonate.tar.gz::https://github.com/lwthiker/curl-impersonate/archive/refs/tags/${pkgver}.tar.gz"
)

md5sums=('77760f18eeea4e169b5abf469e43e61c')

build () {
  cd curl-impersonate-${pkgver/v/}
  autoconf
  mkdir -p build
  cd build
  ../configure --prefix="${pkgdir}/usr/local/"
  make firefox-build
}

package () {
  mkdir -p "${pkgdir}/usr/local/"
  cd curl-impersonate-${pkgver/v/}/build
  make firefox-install
}
