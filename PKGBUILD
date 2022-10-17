# Maintainer: Andreas Kurth <archlinux@akurth.net>
pkgname='bender'
pkgver=0.26.1
pkgrel=1
pkgdesc="Dependency management tool for hardware design projects"
arch=('x86_64')
url="https://github.com/pulp-platform/${pkgname}"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('667b3c147e7e18f5edfe57eeb8cad020b6f6fda0a9158664a1252385ceaf3d5340ea6fb2ced3a9fdd0b0e4568ebab952313ddd4adf5d0c749ac71e3d9b80a76a')

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
