# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=witness
pkgver=0.6.0
pkgrel=1
pkgdesc="Witness is a pluggable framework for software supply chain risk management. It automates, normalizes, and verifies software artifact provenance."
arch=('any')
license=('Apache')
url="https://github.com/in-toto/witness"
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b339520c1665de3d5d1efa4a4c4f97cd8f0c3a152ff9ab9abca94e41e4c1924a')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build -o bin/${pkgname}
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 -t "${pkgdir}/usr/bin" bin/${pkgname}
}
