# Maintainer: Khorne <khorne AT khorne DOT me>
pkgname=drone 
pkgver=1.2.1
pkgrel=1
pkgdesc="Drone is a Continuous Delivery platform built on Docker, written in Go - OSS variant"
arch=('x86_64')
url="https://drone.io"
license=('Apache')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=(c0ffda74f715dbbd7cef3103af055026d95a1300110b5d4f0017959ed799d29f)

build() {
    cd "$pkgname-$pkgver"
    go build -tags oss -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}" ./cmd/drone-server
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname"-server "$pkgdir"/usr/bin/"$pkgname"-server
}

