# Maintainer: Pysio <qq593277393@outlook.com>
pkgname=lolia-cli
pkgver=0.67.4
pkgrel=1
pkgdesc="Fast, simple, and elegant one-click launch for LoliaFRP"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/Lolia-FRP/lolia-frp"
license=('Apache')
makedepends=('go>=1.24.0' 'git' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a9b587d9da6a84b3a6ec66f5fe6a73167b52d1ff547f3cc197d6c184cc22f92a')

build() {
    cd "${srcdir}/lolia-frp-${pkgver}"
    
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    
    # Build frpc web interface
    make frpc-web
    
    # Build frpc binary
    make frpc
}

package() {
    cd "${srcdir}/lolia-frp-${pkgver}"
    
    # Install the binary as lolia-cli
    install -Dm755 "bin/frpc" "${pkgdir}/usr/bin/lolia-cli"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
