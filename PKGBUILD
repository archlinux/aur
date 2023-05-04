# Maintainer: Richard Murri <richardmurri@gmail.com>

pkgname=cw-cloudwatch
pkgver=4.1.3
pkgrel=1
pkgdesc='The best way to tail AWS CloudWatch Logs from your terminal'
arch=('x86_64')
url="https://github.com/lucagrulla/cw"
license=('Apache')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7780a47ca0912d6d2d1f39dc59c65211eef8b189296813aabcffeda0585c9d2')


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
