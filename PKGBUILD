# Maintainer: slatkin@gmail.com
pkgname=mby
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal client for Emby media server"
arch=('x86_64')
url="https://github.com/slatkin/mby"
license=('MIT')
depends=('mpv' 'openssl')
makedepends=('rust' 'cargo' 'nasm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/slatkin/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('743a4893cab437a8fb167b3cfbda763c97e72c00bf223b29a5389681ffd1f55d')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "scripts/mby.lua" "${pkgdir}/usr/share/${pkgname}/scripts/mby.lua"
    install -Dm644 "fonts/Material-Design-Iconic-Font.ttf" \
        "${pkgdir}/usr/share/${pkgname}/fonts/Material-Design-Iconic-Font.ttf"
    install -Dm644 "dist/config.toml" "${pkgdir}/usr/share/${pkgname}/config.toml"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
