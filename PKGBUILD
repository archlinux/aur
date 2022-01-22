# Maintainer: Naohisa Murakami <tiqwab.ch90@gmail.com>

pkgname=tftpff
pkgver=0.1.0
pkgrel=1
pkgdesc='Firewall-friendly TFTP server'
url='https://github.com/tiqwab/tftpff'
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
backup=('etc/conf.d/tftpff')
source=(${pkgname}-v${pkgver}.tar.gz::https://github.com/tiqwab/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('7110b65863c4d8968d5b466109f34e8af66234437c10ffbfb43a53c95d0c7a04')

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
