# Maintainer: Richard Murri <richardmurri@gmail.com>

pkgname=cw-cloudwatch
pkgver=4.1.1
pkgrel=1
pkgdesc='The best way to tail AWS CloudWatch Logs from your terminal'
arch=('x86_64')
url="https://github.com/lucagrulla/cw"
license=('Apache')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('49542e32cdf910a5bbebda1c841a1fac11c4224ef23c8b35cc4632b1bdb788a8')


prepare(){
  cd "cw-$pkgver"
  mkdir -p build/
}

build() {
  cd "cw-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "cw-$pkgver"
  go test
}

package() {
  cd "cw-$pkgver"
  install -Dm755 build/cw "$pkgdir"/usr/bin/cw
}
