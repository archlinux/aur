# Maintainer: David Birks <david@tellus.space>

pkgname=kube-score
pkgver=1.3.0
pkgrel=1
pkgdesc='A tool that performs static code analysis of your Kubernetes object definitions'
arch=('x86_64')
url='https://github.com/zegl/kube-score'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zegl/kube-score/archive/v$pkgver.tar.gz")
sha512sums=('340286f12db446c8c008e8ac7cf735dcdd899ac732b48ded797b9cfd49bcb14d01fa11b9020b4bbeae80e533a01a026af4a770a0afa052a7fe119583573ddb44')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build --ldflags "-X main.version=$pkgver" ./cmd/kube-score
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
