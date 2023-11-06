# Maintainer: svalo <code@valo.space>

pkgname=crt
pkgver=0.1.0
pkgrel=1
pkgdesc='CLI tool to check Certificate Transparency logs of a domain name'
arch=('x86_64')
url="https://github.com/cemulus/crt"
license=('APACHE')
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1ec11b291b2c46c4427afcacf7b76a61bbf7e8b14fa9f7f286a86ad56e793ce')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
