# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=teehee
pkgver=0.2.8
pkgrel=1
pkgdesc='A modal terminal hex editor'
arch=('x86_64' 'aarch64')
url='https://github.com/Gskartwii/teehee'
license=('Apache')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.gz.sig")
sha256sums=('3f14f684f7512f66801bfc3298c0a823ad7ff604925969c9daeaab3bd8e0dd3c'
            'SKIP')
validpgpkeys=('9330E5D6861507BEFBF1893347E208E66179DC94')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}

# vim:set ts=4 sw=4 et:
