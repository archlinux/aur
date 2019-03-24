# Maintainer: Khorne <khorne AT khorne DOT me>
pkgname=drone 
pkgver=1.0.0
pkgrel=1
pkgdesc="Drone is a Continuous Delivery platform built on Docker, written in Go - OSS variant"
arch=('x86_64')
url="https://drone.io"
license=('Apache')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('32b896cc1a639b401f7b8857e2779c0cecb379e2e5f198bfa4545769ccb24139')

build() {
    cd "$pkgname-$pkgver"
    go build -tags oss -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" -ldflags "-extldflags ${LDFLAGS}" ./server
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname"-server "$pkgdir"/usr/bin/"$pkgname"-server
}

