# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gotify-desktop
pkgver=1.3.3
pkgrel=1
pkgdesc='Small Gotify daemon to send messages as desktop notifications '
arch=('aarch64' 'x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs'
         'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('42561d2f46df7065528a6ed06279e091311dfa83847e558d22be275ceb0ee05e416fe9de99309531c87b5716d3d58b73482741f1732515b63821d650128d0f6c')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 755 -t "${pkgdir}/usr/share/applications" ./desktop/gotify-desktop.desktop
    install -Dm 755 desktop/icon.png "${pkgdir}/usr/share/icons/hicolor/96x96/apps/gotify-desktop.png"
}
