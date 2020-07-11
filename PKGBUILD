# Maintainer: David Birks <david@birks.dev>

pkgname=kube-score
pkgver=1.7.2
pkgrel=1
pkgdesc='A tool that performs static code analysis of your Kubernetes object definitions'
arch=('x86_64')
url='https://github.com/zegl/kube-score'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zegl/kube-score/archive/v$pkgver.tar.gz")
sha512sums=('03c4e83b5b457d5a133e107e07a51077caba040ceab0b6abcb1849a3993a74deb37d3aaf57a563c564f1c7f45fac36052cc57d719f668f2e56e5b758c1e22546')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build --ldflags "-X main.version=$pkgver" ./cmd/kube-score
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
