# Maintainer: Oscar Cowdery Lack <oscar.cowderylack@gmail.com>
pkgname=nats-server
pkgver=2.10.10
pkgrel=1
pkgdesc="High-Performance server for NATS.io, the cloud and edge native messaging system"
arch=(x86_64)
url="https://github.com/nats-io/nats-server"
license=('Apache-2.0')
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1228e9a0d2ea8390c3b7d17cffc24f76dfa182197bb447e947c1ef6e0b005b4')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ./$pkgname "$pkgdir"/usr/bin/$pkgname
}
