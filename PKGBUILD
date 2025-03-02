# Maintainer: Andreas Kurth <archlinux@akurth.net>
pkgname='morty-pulp'
_pkgname='morty'
pkgver=0.9.0
pkgrel=1
pkgdesc="Morty reads SystemVerilog files and pickles them into a single file for easier handling"
arch=('x86_64')
url="https://github.com/pulp-platform/${_pkgname}"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    cargo test --release --locked --target-dir=target
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha512sums=('884f2fd879826284bb420bcdff71e5d81781d1b9a671b0ae869b11dd8b56913e212571987a969dff8e5d5cb3e603d2086245b72225bc98cb7c3ecd45b57450ee')
