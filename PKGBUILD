# Maintainer: Ales Katona <almindor@gmail.com>
pkgname=rx
pkgver=0.5.2
pkgrel=2
pkgdesc='A modern and extensible pixel editor implemented in rust.'
arch=(x86_64)
url='https://rx.cloudhead.io/'
license=('GPL3')
makedepends=('clang' 'cargo' 'cmake' 'libxcursor' 'xorg-xinput')
source=("https://github.com/cloudhead/rx/archive/v${pkgver}.tar.gz")
sha256sums=('1a2a28afd7ea8a0cde030a12cb5d0d8543a68829edd789215cc4f1eaa5cc4d12')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-${pkgver}/target/release/rx"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}-${pkgver}/rx.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "${srcdir}/${pkgname}-${pkgver}/rx.png"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps" "${srcdir}/${pkgname}-${pkgver}/rx.png"
}
