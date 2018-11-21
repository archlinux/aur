# Maintainer: rawkode <david.andrew.mckay@gmail.com>

pkgname=openfaas-cli
pkgdir="pkg-build"
pkgdesc="OpenFaaS CLI"
pkgver=0.7.8
pkgrel=1
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/openfaas/faas-cli"
license=('mit')
makedepends=('go' 'dep')

source=("https://github.com/openfaas/faas-cli/archive/$pkgver.tar.gz")
sha256sums=('f5607b12a6c7083ad4087ef22dceea447f730881ba18986c257d106b8f9680b0')

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
