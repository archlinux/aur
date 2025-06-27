# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=zenta
pkgver=0.3.1
pkgrel=1
pkgdesc="mindfulness for terminal users "
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/e6a5/zenta"
license=('MIT')
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/e6a5/zenta/archive/refs/tags/v$pkgver.tar.gz"
)
b2sums=('102fe03c0c28a0499d15fb98db58ecf998e96c96fdd287d57ed23f2fbfeb17ae0b396408380b432722e596c80fec81817c1036e148a2125eea80d8d02bb37c43')

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
