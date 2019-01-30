# Maintainer: rawkode <rawkode@pm.me>

pkgname=openfaas-cli
pkgdir="pkg-build"
pkgdesc="OpenFaaS CLI"
pkgver=0.8.3
pkgrel=1
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/openfaas/faas-cli"
license=('mit')
makedepends=('go' 'dep')

source=("https://github.com/openfaas/faas-cli/archive/$pkgver.tar.gz")
sha256sums=('6f5190441bd8cd036284f04e1fa337854a170ccf9d26ca71318a4b7b237d3e93')

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
