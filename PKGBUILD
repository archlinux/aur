# Maintainer: Jojii <jojii@gmx.net>
pkgname=yayim
pkgver=10.0.4
pkgrel=2
pkgdesc="A modified version of yay with additional features, improvements and small bug fixes"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://gitea.jojiiofficial.de/jojii/yayim"
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
source=("${pkgname}-${pkgver}.tar.gz::https://gitea.jojiiofficial.de/jojii/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a2ee5de9de306507d3595f1d98b88b459960d1f5f5e8b3430ffc966d7317f666')

build() {
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "$srcdir/$pkgname"
  LDFLAGS="-extldflags \"${LDFLAGS}\"" \
    make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$pkgname"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX="/usr" install
}
