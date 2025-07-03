# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=zenta
pkgver=1.0.0
pkgrel=1
pkgdesc="mindfulness for terminal users "
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/e6a5/zenta"
license=('MIT')
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/e6a5/zenta/archive/refs/tags/v$pkgver.tar.gz"
)
b2sums=('e1a53831064175bf09bf8a558a865008f0b324ee66dd260a70d11fb3f9295ce34145c136f67686acfad3b92d29cbb761e3d517d7261f717234f4e3e726f95a47')

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
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
