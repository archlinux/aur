# Maintainer: Khorne <khorne AT khorne DOT me>
pkgname=drone
pkgver=1.4.0
pkgrel=1
pkgdesc="Drone is a Continuous Delivery platform built on Docker, written in Go - OSS variant"
arch=('x86_64')
url="https://drone.io"
license=('Apache')
makedepends=('go' 'git')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
source=("$pkgname-$pkgver::git+https://github.com/$pkgname/$pkgname.git#commit=3a7ae654fc66b41ec1ecdfbcf23e8b4262c3cb24")
md5sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    go build -tags "oss nolimit" -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}" ./cmd/drone-server
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname"-server "$pkgdir"/usr/bin/"$pkgname"-server
}

