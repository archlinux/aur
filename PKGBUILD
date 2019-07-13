# Maintainer: David Birks <david@tellus.space>

pkgname=oras
pkgver=0.5.0
pkgrel=1
pkgdesc='A command line tool that allows you to push and pull files from any OCI registry'
arch=(x86_64)
url='https://github.com/deislabs/oras'
license=(MIT)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deislabs/oras/archive/v$pkgver.tar.gz")
sha512sums=('e87ac50027859fbc6e1ca12b14bb4add18d138609649e42bb71eb856e8b1686b692b4daaa37c0fddd210ebb2dcfd815c9c4474a007a3939c4af19174ef773335')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  VERSION=$pkgver

  cd $pkgname-$pkgver
  make build-linux
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/bin/linux/amd64/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
