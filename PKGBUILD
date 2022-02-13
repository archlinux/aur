# Maintainer: Dawson Dias <thexerothermicsclerodermoid@gmail.com>

pkgname=stevenarella-git
_pkgname=stevenarella
pkgver=r968.g3b43c76
pkgrel=1
pkgdesc='Multi-protocol Minecraft-compatible client written in Rust'
arch=('x86_64')
url='https://github.com/iceiix/stevenarella'
license=('APACHE' 'MIT')
depends=('openssl' 'rust' 'xcb-util')
source=("git://github.com/iceiix/stevenarella.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    echo r$(git rev-list --all --count).g$(git rev-parse --short HEAD)
}

package() {
    cd "${srcdir}/${_pkgname}"

    CARGO_INSTALL_ROOT="${pkgdir}/usr" cargo install --path .

    rm "${pkgdir}/usr/.crates.toml"
    rm "${pkgdir}/usr/.crates2.json"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
    install -Dm644 "${srcdir}/${_pkgname}/resources/icon128x128.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
