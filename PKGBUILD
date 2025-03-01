# Maintainer: Dwi Mulia Mokoginta <dwi-mulia-mokoginta@protonmail.com>

_pkgname="darkflare"
pkgname="$_pkgname"
pkgver=1.3.3
pkgrel=1
pkgdesc="A stealthy command line tool to create TCP-over-CDN(http) tunnels that keep your connections cozy and comfortable."
url="https://github.com/doxx/darkflare"

arch=('x86_64' 'arm64')
depends=('glibc')
makedepends=('go')

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
  'bd56ec7163294b0998b82c4657a6b12de6177ef915913d88e069badd8b70f873'
)

build() {
  cd $_pkgname-$pkgver

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -o $_pkgname-client client/main.go
  go build -o $_pkgname-server server/main.go
}

package() {
  cd $_pkgname-$pkgver

  install -Dm755 $_pkgname-client -t "$pkgdir/usr/bin"
  install -Dm755 $_pkgname-server -t "$pkgdir/usr/bin"
}
