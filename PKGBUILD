# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('tuf')
_pkgname=('go-tuf')
pkgver=0.5.2
pkgrel=1
pkgdesc="Implementation of The Update Framework"
arch=('x86_64')
license=('BSD')
url="https://github.com/theupdateframework/go-tuf"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
depends=('glibc')
makedepends=('go' 'git')
sha256sums=('b5d3bce7e27ea3d6e6e972c66b466f0cd58532a0dd3656da2143bdfdd47a8fdf')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${srcdir}/${_pkgname}-${pkgver}"
    go build -o tuf ./cmd/tuf
    go build -o tuf-client ./cmd/tuf-client
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" tuf
    install -Dm 755 -t "${pkgdir}/usr/bin" tuf-client
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
