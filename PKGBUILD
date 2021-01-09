# Maintainer: David Birks <david@tellus.space>

pkgname=oras
pkgver=0.8.1
pkgrel=1
pkgdesc='A command line tool that allows you to push and pull files from any OCI registry'
arch=(x86_64)
url='https://github.com/deislabs/oras'
license=(MIT)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deislabs/oras/archive/v$pkgver.tar.gz")
sha512sums=('75b16c2c6fc5a27afaf44399c72f6aa654067507226ffbbfee97862dc53fb6ed944ecc1e1e790dbfe1d5d9f209d71915284b63e0beeab02864395b8385b5f004')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export VERSION=$pkgver

  cd $pkgname-$pkgver
  make build-linux
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/bin/linux/amd64/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
