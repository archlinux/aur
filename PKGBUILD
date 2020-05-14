# Maintainer: David Birks <david@birks.dev>

pkgname=kube-score
pkgver=1.7.0
pkgrel=1
pkgdesc='A tool that performs static code analysis of your Kubernetes object definitions'
arch=('x86_64')
url='https://github.com/zegl/kube-score'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zegl/kube-score/archive/v$pkgver.tar.gz")
sha512sums=('8d968e7289757ff7d5d3ef033b283663edbbb949162715ba10c1375bab00dd2074a13b08bbf354420aeed7bb2167c9b74237b6b8b3157983490d99592f6198b7')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build --ldflags "-X main.version=$pkgver" ./cmd/kube-score
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
