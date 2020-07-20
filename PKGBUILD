# Maintainer: Jojii <jojii@gmx.net>
pkgname=yayim
pkgver=10.0.3
pkgrel=1
pkgdesc="A modified version of yay with additional features, improvements and small bug fixes"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://git.jojii.de/jojii/yayim"
license=('GPL')
depends=(
  'libalpm.so>=12'
  'sudo'
  'git'
)
makedepends=(
  'go'
)
provides=("yay")
conflicts=("yay")
source=("${pkgname}-${pkgver}.tar.gz::https://git.jojii.de/jojii/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('76f692a699159b59171bf3542f6dd44d30d7bb00ffeaf257fbc2132c2c14baed')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "$srcdir/$pkgname-v$pkgver"
  LDFLAGS="-extldflags \"${LDFLAGS}\"" \
    make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
}
