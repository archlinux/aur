# Maintainer: David Birks <david@tellus.space>

pkgname=conftest
pkgver=0.11.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/instrumenta/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/conftest/archive/v$pkgver.tar.gz")
sha512sums=('4e62b6c672680426d4f60ec180886d9c590592e9708956ea5b6f1e4b2673ec094283c76678ebe71961ed7ef047167b329182ff549ceff2f4d96ac6de50def7e2')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build --ldflags "-X github.com/instrumenta/conftest/pkg/constants.Version=$pkgver" -o conftest cmd/main.go
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
