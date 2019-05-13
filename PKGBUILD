# Maintainer: rawkode <rawkode@pm.me>

pkgname=openfaas-cli
pkgdir="pkg-build"
pkgdesc="OpenFaaS CLI"
pkgver=0.8.11
pkgrel=1
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/openfaas/faas-cli"
license=('mit')
makedepends=('go' 'dep')

source=("https://github.com/openfaas/faas-cli/archive/$pkgver.tar.gz")
sha256sums=('0e0ca9c3c946b46f44f7614c34be47a2f873a9a97efcb05c27b7c06fee37f861')

build() {
  GOPATH=$startdir
  rm -rf $GOPATH/pkg || true
  cd "$srcdir/faas-cli-$pkgver"

  dep ensure
  CGO_ENABLED=0 GOOS=linux go build --ldflags "-s -w -X github.com/openfaas/faas-cli/version.Version=$pkgver" -a -installsuffix cgo -o faas-cli
}

package() {
  install -Dm 755 "$srcdir/faas-cli-$pkgver/faas-cli" "$pkgdir/usr/bin/faas-cli"
}
