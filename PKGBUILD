# Maintainer: John Downey <jdowney@gmail.com>
pkgname=smug
pkgver=0.1.9
pkgrel=1
pkgdesc='A session manager for tmux written in Go'
arch=('x86_64')
url="https://github.com/ivaaaan/smug"
license=('MIT')
makedepends=('go')
source=("https://github.com/ivaaaan/smug/archive/v${pkgver}.tar.gz")
sha256sums=('90babce69f4687f7937a813228f19ab4659c2cdf85f31e29a3ecac5bb07f71a3')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "$pkgname-$pkgver"
  go test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
