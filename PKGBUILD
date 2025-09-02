# Maintainer: Dwi Mulia Mokoginta <dwi-mulia-mokoginta@protonmail.com>

pkgname="darkflare"
pkgver=1.3.3
pkgrel=2
pkgdesc='A stealthy command line tool to create TCP-over-CDN(http) tunnels that keep your connections cozy and comfortable.'
url='https://github.com/doxx/darkflare'

arch=('any')
depends=('glibc')
makedepends=('go')

conflicts=("$pkgname-bin" "$pkgname-git")
provides=("$pkgname")

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)

sha256sums=(
  'bd56ec7163294b0998b82c4657a6b12de6177ef915913d88e069badd8b70f873'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build -o $pkgname-client client/main.go
  go build -o $pkgname-server server/main.go
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 $pkgname-client -t "$pkgdir/usr/bin"
  install -Dm755 $pkgname-server -t "$pkgdir/usr/bin"
}
