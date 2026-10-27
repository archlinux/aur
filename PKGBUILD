# Maintainer: wuxxin <wuxxin@gmail.com>

pkgname=coreos-installer
pkgver=0.27.0
pkgrel=1
pkgdesc="Installer for CoreOS disk images"
url="https://github.com/coreos/coreos-installer"
depends=('cargo')
arch=('x86_64')
license=('APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coreos/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b1491d7f0af8e01c80e77e9d480301b9bd23bf4dd9752019a7b1182c299810be')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
