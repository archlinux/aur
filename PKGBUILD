# Maintainer: Michael Behrens <mfbehrens@t-online.de>
# Contributor: Luca Bauer <git@lucabauer.de>

pkgname=kosmonaut
pkgver=0.0.1_rc1
pkgrel=1
pkgdesc="A modern NetworkManager TUI written in Rust"
arch=('x86_64')
url="https://codeberg.org/kosmonaut/kosmonaut"
license=('GPL-3.0-only')
depends=('networkmanager')
makedepends=('rust')
conflicts=('kosmonaut-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('4cd875ff70a5c145859eeb9c925dd60979bea75a9756da30e2d9ffcb12748f9a')

prepare() {
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --frozen --release
}

# check() {
#     cd "${srcdir}/${pkgname}"
#     cargo test --frozen
# }

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
