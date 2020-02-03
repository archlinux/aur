# Maintainer: Khorne <khorne AT khorne DOT me>
pkgname=drone
pkgver=1.6.5
pkgrel=1
pkgdesc="Drone is a Continuous Delivery platform built on Docker, written in Go - OSS variant"
arch=('x86_64')
url="https://drone.io"
license=('Apache')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('443c57564b74736dcbdeb8fb90f04865f1cdeefa9b5a8494f068f1bc640aab18')

build() {
    cd "$pkgname-$pkgver"
    go build -tags "oss nolimit" -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}" ./cmd/drone-server
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname"-server "$pkgdir"/usr/bin/"$pkgname"-server
}

