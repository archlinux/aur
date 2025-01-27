# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=curl-impersonate-chrome
pkgver=v0.9.0
pkgrel=1
pkgdesc="A special compilation of curl that makes it impersonate Chrome"
url="https://github.com/lexiforest/curl-impersonate"
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=(tar gcc cmake go ninja unzip zlib autoconf automake libtool patch)
depends=(nss)
provides=(curl-impersonate-chrome libcurl-impersonate-chrome)
conflicts=(curl-impersonate-bin)

# WORKAROUND The default /etc/makepkg.conf shipped by arch comes with -Werror=format which can't be 
# overriden otherwise and wont let boringssl compile
options=("!buildflags")

source=(
  "curl-impersonate.tar.gz::https://github.com/lexiforest/curl-impersonate/archive/refs/tags/${pkgver}.tar.gz"
)

md5sums=('6f0daad3f0545664ec22590ff8504393')

build () {
  cd curl-impersonate-${pkgver/v/}
  autoconf
  mkdir -p build
  cd build
  ../configure --prefix="${pkgdir}/usr"
  make chrome-build
}

package () {
  mkdir -p "${pkgdir}/usr"
  cd curl-impersonate-${pkgver/v/}/build
  make chrome-install
}
