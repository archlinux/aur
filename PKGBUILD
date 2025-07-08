# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=zenta
pkgver=1.0.1
pkgrel=1
pkgdesc="mindfulness for terminal users "
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64')
url="https://github.com/e6a5/zenta"
license=('MIT')
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/e6a5/zenta/archive/refs/tags/v$pkgver.tar.gz"
)
b2sums=('d5719676de11fc414794d39d25b6bb8f1406013c76a7a3cf4a021b46ea2210808809486a618b7f293da2aa175643eeabafab36dd7dfa791306aed166a2577bf7')

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
