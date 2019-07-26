# Maintainer: David Birks <david@tellus.space>

pkgname=conftest
pkgver=0.10.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/instrumenta/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/conftest/archive/v$pkgver.tar.gz")
sha512sums=('d21f06203a5227f3ccbc0b5f963542f57677ffccaddc20410fc8328a5a4d3a4eca92d294d352aefc1cc53ba896c34ba314cd65ae1948c4662bec42bf575e8652')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build --ldflags "-X github.com/instrumenta/conftest/pkg/constants.Version=$pkgver" -o conftest cmd/main.go
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
