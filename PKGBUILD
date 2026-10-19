# Maintainer: Michael Behrens <mfbehrens@t-online.de>
# Contributor: Luca Bauer <git@lucabauer.de>

pkgname=kosmonaut
pkgver=0.0.1_rc3
pkgrel=1
pkgdesc="A modern NetworkManager TUI written in Rust"
arch=('x86_64')
url="https://codeberg.org/kosmonaut/kosmonaut"
license=('GPL-3.0-only')
depends=('networkmanager')
makedepends=('rust')
conflicts=('kosmonaut-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('28acfcca2ee25c065ee26c9e9ad2439ca4ca0e9c3044a563d3392cb1991c62e2')

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
