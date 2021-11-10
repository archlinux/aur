# Maintainer: Andreas Kurth <archlinux@akurth.net>
pkgname='bender'
pkgver=0.23.1
pkgrel=1
pkgdesc="Dependency management tool for hardware design projects"
arch=('x86_64')
url="https://github.com/pulp-platform/${pkgname}"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('cff6a055d5404e4f9a92e92664054cb5836e43422eac319ef855db58b05ba5a7014b9d8a4249663ddd0ab801956cb88a9f9988ec1103cf2a272d6eb2d2e30603')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo test --release --locked --target-dir=target
    tests/run_all.sh
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
