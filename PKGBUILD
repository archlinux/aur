# Maintainer: Jojii <jojii@gmx.net>
pkgname=yayim
pkgver=10.0.3_2
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
sha256sums=('b8c56f2a1c97564d5b2efa11023d218b4091d935b08d91ab36f1cde3db30822e')

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
