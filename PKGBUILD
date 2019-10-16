# Maintainer: David Birks <david@tellus.space>

pkgname=oras
pkgver=0.7.0
pkgrel=1
pkgdesc='A command line tool that allows you to push and pull files from any OCI registry'
arch=(x86_64)
url='https://github.com/deislabs/oras'
license=(MIT)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deislabs/oras/archive/v$pkgver.tar.gz")
sha512sums=('48ece2e8bdf17785b7a775f7e1778ab6b09751cb36c65575088038b08884095760ddb58a7e0bc519338e94983a08424e350a0b5786340616c1295a084529c5dd')

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
