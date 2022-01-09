# Maintainer: Naohisa Murakami <tiqwab.ch90@gmail.com>

pkgname=tftpff
pkgver=0.0.1
pkgrel=3
pkgdesc='Firewall-friendly TFTP server'
url='https://github.com/tiqwab/tftpff'
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
backup=('etc/conf.d/tftpff')
source=(${pkgname}-v${pkgver}.tar.gz::https://github.com/tiqwab/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('776494ba3a6f948ef951afd697b153e47234453ea5585d8da4916f659f1fa96e')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 "pkg/archlinux/tftpff.service" "${pkgdir}/usr/lib/systemd/system/tftpff.service"
    install -Dm 644 "pkg/archlinux/tftpff.conf" "${pkgdir}/etc/conf.d/tftpff"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
