# Maintainer: rawkode <david.andrew.mckay@gmail.com>

pkgname=openfaas-cli
pkgdir="pkg-build"
pkgdesc="OpenFaaS CLI"
pkgver=0.6.11
pkgrel=1
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/openfaas/faas-cli"
license=('mit')
makedepends=('go' 'dep')

source=("https://github.com/openfaas/faas-cli/archive/$pkgver.tar.gz")
sha256sums=('07fbf1886fc50411e0e1f69c5f93957c9f99a2e75a023f82931ee978ba3fa2c7')

build() {
  GOPATH=$startdir
  sudo rm -rf $GOPATH/pkg
  cd "$srcdir/faas-cli-$pkgver"

  dep ensure
  CGO_ENABLED=0 GOOS=linux go build --ldflags "-s -w -X github.com/openfaas/faas-cli/version.Version=0.6.10" -a -installsuffix cgo -o faas-cli
}

package() {
  install -Dm 755 "$srcdir/faas-cli-$pkgver/faas-cli" "$pkgdir/usr/bin/faas-cli"
}
