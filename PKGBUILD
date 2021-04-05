# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=teehee
pkgver=0.2.2
pkgrel=1
pkgdesc='A modal terminal hex editor'
arch=('x86_64')
url='https://github.com/Gskartwii/teehee'
license=('Apache')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.gz.sig")
sha256sums=('8b1a334731943f593b4073c37a03fc56e806621e3073996314bd8c85a07a34c8'
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
