# Maintainer: David Birks <david@tellus.space>
# Contributor: David Stark <david@starkers.org>

pkgname=dive
pkgver=0.8.0
pkgrel=1
pkgdesc='A tool for exploring each layer in a docker image'
url='https://github.com/wagoodman/dive'
arch=('x86_64')
license=('MIT')
depends=('docker')
makedepends=('go')
conflicts=('dive-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wagoodman/dive/archive/v$pkgver.tar.gz")
sha256sums=('5cf8f745cf1942693eccdb7d75f4b2e170437c60a6f8a6c57f7dc3fadabebf4c')

build() {
  # Trim pwd from path
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build --ldflags "-X main.version=$pkgver" .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/dive" "$pkgdir/usr/bin/dive"
}
