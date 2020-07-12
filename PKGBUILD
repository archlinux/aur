# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=rbw
pkgver=0.4.6
pkgrel=1
makedepends=('rust' 'cargo')
depends=('pinentry' 'openssl')
conflicts=('rbw-git' 'rbw-bin')
provides=('rbw')
arch=('i686' 'x86_64')
url="https://git.tozt.net/${pkgname}"
source=(https://git.tozt.net/rbw/snapshot/${pkgname}-${pkgver}.tar.gz)
sha256sums=('634a05a9bd5e94964c6ecb12f16913b0554764aaf1730f679b6c6ce8b6b52d2e')
pkgdesc="unofficial bitwarden cli"
license=('MIT')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release --locked
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 target/release/rbw -t "${pkgdir}/usr/bin"
    install -Dm 755 target/release/rbw-agent -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
