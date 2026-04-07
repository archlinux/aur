# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=nog
pkgver=0.6.0
pkgrel=1
pkgdesc="Tier-aware package manager for KognogOS — wraps pacman with three-tier update management"
arch=('x86_64')
url="https://github.com/jetomev/KognogOS"
license=('GPL3')
depends=('pacman' 'pacman-contrib')
backup=('etc/nog/nog.conf' 'etc/nog/tier-pins.toml')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jetomev/KognogOS/archive/refs/tags/v0.7.1-alpha.tar.gz")
sha256sums=('389e605c17ff7877fdba2507465bdef5a813e5af95165ca0e4da3a0be7b26c0f')

build() {
    cd "${srcdir}/KognogOS-0.7.1-alpha/nog"
    cargo build --release
}

package() {
    cd "${srcdir}/KognogOS-0.7.1-alpha"

    # Install the nog binary
    install -Dm755 nog/target/release/nog "${pkgdir}/usr/bin/nog"

    # Install default config files
    install -Dm644 config/nog.conf "${pkgdir}/etc/nog/nog.conf"
    install -Dm644 config/tier-pins.toml "${pkgdir}/etc/nog/tier-pins.toml"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Install man page
    install -Dm644 nog.1 "${pkgdir}/usr/share/man/man1/nog.1"
}