# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=zenta
pkgver=1.1.0
pkgrel=1
pkgdesc="mindfulness for terminal users "
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/e6a5/zenta"
license=('MIT')
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/e6a5/zenta/archive/refs/tags/v$pkgver.tar.gz"
)
b2sums=('95d261232d87fbf26d989f0ab4cdcb38bf6a65caac3c56993acbca3dead5dd0cf2afbcefc0488e3dffd1f98bf584233fe3d58b533c24d897b327638e19902050')

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
