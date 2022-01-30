# Maintainer: Michael Riegert <michael at eowyn net>

pkgname='blflash'
pkgver=0.3.3
pkgrel=1
pkgdesc='BL602 serial flasher'
arch=('x86_64')
url=https://github.com/spacemeowx2/blflash
license=('MIT')
depends=('cargo')
source=("${pkgname}"-"${pkgver}".tar.gz::${url}/archive/v"${pkgver}".tar.gz)
sha256sums=('bb89be8ada704271d1773b4cb595cb4f66c3548f7cc0053ee2a13ea01e964e46')

# pkgver() {
#
#     git describe --long --tags | sed 's/-/./g;s/v//g'
# }

build(){
    cd "${pkgname}"-"${pkgver}"
    cargo build --release --target-dir=target
}

package() {
    cd "${pkgname}"-"${pkgver}"
    install -Dm644 LICENSE-MIT "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
    install -Dm755 target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
