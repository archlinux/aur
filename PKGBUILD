# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname="hola-proxy"
pkgver=1.4.4
pkgrel=1
pkgdesc="Standalone Hola proxy client"
arch=(x86_64)
url="https://github.com/Snawoot/hola-proxy"
license=(MIT)
makedepends=(go)
source=("https://github.com/Snawoot/hola-proxy/archive/v${pkgver}.tar.gz")
sha256sums=('dcac4756d457c7c473f6a016eae9d6aaeaba3115bb44475babcedad54d9e4dc9')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${pkgname}-${pkgver}"
    
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    go build -o build .
}

package() {
    cd "${pkgname}-${pkgver}"
    
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
