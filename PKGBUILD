# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=code-stream-cli
pkgver=0.1.10
pkgrel=1
pkgdesc='VMware vRealize Automation Code Stream CLI'
arch=('x86_64')
url="https://github.com/vmware/code-stream-cli"
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eaf05ea29887cc060049fb60bc14bb23334ba8548212ce18e2542090419f8edb')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o cs-cli
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 cs-cli "$pkgdir"/usr/bin/$pkgname
}
