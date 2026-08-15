# Maintainer: Pysio <qq593277393@outlook.com>
pkgname=lolia-cli
pkgver=0.71.0
pkgrel=1
pkgdesc="Fast, simple, and elegant one-click launch for LoliaFRP"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/Lolia-FRP/lolia-frp"
license=('Apache')
makedepends=('go>=1.25.0' 'git' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d1176339b561860040859a5c5fa431d5e2ad5213d042b01c37a7b1a1ede27226')

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
