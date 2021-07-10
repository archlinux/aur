# Maintainer: Khorne <khorne AT khorne DOT me>
pkgname=drone
pkgver=2.0.3
pkgrel=1
pkgdesc="Drone is a Continuous Delivery platform built on Docker, written in Go - OSS variant"
arch=('x86_64')
url="https://drone.io"
license=('Apache')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('354b60a8616dfa17ebe3f82026f0865619e55f0725a60d850ce81c50733debcb')

build() {
    cd "$pkgname-$pkgver"
    go build -tags "oss nolimit" -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}" ./cmd/drone-server
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname"-server "$pkgdir"/usr/bin/"$pkgname"-server
}

