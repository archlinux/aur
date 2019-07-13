# Maintainer: David Birks <david@tellus.space>

pkgname=conftest
pkgver=0.8.1
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/instrumenta/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/conftest/archive/v$pkgver.tar.gz")
sha512sums=('a748653b0cfa8b00027d249852748ee222afb1521fdec7553bee6d828a9693a783b182bd8cfcb5d8834aa35a9dcbb4c33b009873798ec32a0bfeeac1a52aac1c')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build -ldflags "-X main.version=$pkgver" .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
