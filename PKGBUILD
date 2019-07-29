# Maintainer: David Birks <david@tellus.space>

pkgname=kube-score
pkgver=1.1.0
pkgrel=1
pkgdesc='A tool that performs static code analysis of your Kubernetes object definitions'
arch=('x86_64')
url='https://github.com/zegl/kube-score'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zegl/kube-score/archive/v$pkgver.tar.gz")
sha512sums=('fab2fd246c9052a6b8a1ad76a238493c8d2912706a2c8f0a63c939ec573603c8828967503be516efb9d3bda344abb9ded3f366f550d539904e08d3600ff91b0d')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build --ldflags "-X main.version=$pkgver" ./cmd/kube-score
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
