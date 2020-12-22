# Maintainer: John Downey <jdowney@gmail.com>
pkgname=smug
pkgver=0.1.1
pkgrel=1
pkgdesc='A session manager for tmux written in Go '
arch=('x86_64')
url="https://github.com/ivaaaan/smug"
license=('MIT')
makedepends=('go')
source=("https://github.com/ivaaaan/smug/archive/v${pkgver}.tar.gz")
sha256sums=('6964222cda2f47ffe56439e95aabaa1cc058f1ff3b2725654f4a54f3798153ea')

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
