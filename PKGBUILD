# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=http-relay
pkgname=drand-$_pkgname
pkgver=2.2.1
pkgrel=1
pkgdesc="An HTTP relay for drand nodes"
arch=(x86_64)
url=https://github.com/drand/http-relay
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(
    git
    go
)
source=($_pkgname::git+https://github.com/drand/http-relay.git#tag=v$pkgver)
b2sums=('7b2162c1598cebac769f479de1c9549975b513c58fddac2d047ac1fb5bb68d11d112267cd0258deed2e6f9ea5c2ffec329cd6e83b2082f4841e8aa28fa5aa0e4')

build() {
    cd $_pkgname
    mkdir -p build
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

package() {
    cd $_pkgname
    install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
