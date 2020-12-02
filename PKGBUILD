# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=rbw
pkgver=0.5.2
pkgrel=1
makedepends=('rust' 'cargo')
depends=('pinentry' 'openssl')
conflicts=('rbw-git' 'rbw-bin')
provides=('rbw')
arch=('i686' 'x86_64')
url="https://git.tozt.net/${pkgname}"
source=(https://git.tozt.net/rbw/snapshot/${pkgname}-${pkgver}.tar.gz)
sha256sums=('5ab3c569ea55eeee6e70130c3d1a3399ac0529b666e2ba12264c1a7b0b5dbc3c')
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
