# Maintainer: David Birks <david@birks.dev>

pkgname=kube-score
pkgver=1.6.0
pkgrel=1
pkgdesc='A tool that performs static code analysis of your Kubernetes object definitions'
arch=('x86_64')
url='https://github.com/zegl/kube-score'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zegl/kube-score/archive/v$pkgver.tar.gz")
sha512sums=('434816d198bf9ca68b44d4997717f01efe0d34247ac558ee494e263fa445fac3c1976969bf71756601cf55a5216efca0b056af104ca5f6d03b894a70f50eba21')

build() {
  # Flags to trim path from binary
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd $pkgname-$pkgver
  go build --ldflags "-X main.version=$pkgver" ./cmd/kube-score
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
