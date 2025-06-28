# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=zenta
pkgver=0.3.5
pkgrel=1
pkgdesc="mindfulness for terminal users "
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/e6a5/zenta"
license=('MIT')
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/e6a5/zenta/archive/refs/tags/v$pkgver.tar.gz"
)
b2sums=('711263a79f647971ee6bd3cc9a0e30b68e8bbef68787a3d6237d6155089086c0357ed2d64c6dcc47f9dfd0c9b13a5d6aa0ce363c6dc488697b82ec5ef664b5c8')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go -C "${srcdir}/$pkgname-$pkgver" build -o zenta
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/zenta" "$pkgdir/usr/bin/zenta"
}
