# Maintainer: Freakness109 <freakness109@gmail.com>
# Contributor: Andreas Kurth <archlinux@akurth.net>
pkgname='bender'
pkgver=0.29.1
pkgrel=1
pkgdesc="Dependency management tool for hardware design projects"
arch=('x86_64')
url="https://github.com/pulp-platform/${pkgname}"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('1768c5a00a6f231d0dac2c0ec2186e4ea51a8c6ad8b4b4d54580d01798eda649564a1506b6c1fa88cae09054f56b1d9424df17e88e3b460e29dc4065c7b78d8c')

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
