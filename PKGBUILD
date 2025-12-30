# Maintainer: structwafel <aur@structwafel.dev>

pkgname=dingo
pkgver=0.6.0
pkgrel=1
pkgdesc="A meta-language for Go with Result types, error propagation, and pattern matching"
arch=('x86_64' 'aarch64')
url="https://github.com/MadAppGang/dingo"
license=('MIT')
makedepends=('go>=1.21')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MadAppGang/dingo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3bac21ef9963cfff32f7ff330ea24711fb717f09f772ce0b8151030649e5857a')

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -o "$pkgname" -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" ./cmd/dingo
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    # Note: Upstream has no LICENSE file but claims MIT on GitHub
}
