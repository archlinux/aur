# Maintainer: Freakness109 <freakness109@gmail.com>
# Contributor: Andreas Kurth <archlinux@akurth.net>
pkgname='bender'
pkgver=0.28.2
pkgrel=1
pkgdesc="Dependency management tool for hardware design projects"
arch=('x86_64')
url="https://github.com/pulp-platform/${pkgname}"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ed66302354b68cb19d24c17daa9b0af66101546303031120500ef11041fa70b3cc80c8cd097952a919d687a824654f055c52557bc7e061d8cbdb723a7ca488f4')

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
