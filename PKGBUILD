# Maintainer: Naohisa Murakami <tiqwab.ch90@gmail.com>

pkgname=tftpff
pkgver=0.0.1
pkgrel=2
pkgdesc='Firewall-friendly TFTP server'
url='https://github.com/tiqwab/tftpff'
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
backup=('etc/conf.d/tftpff')
source=(${pkgname}-v${pkgver}.tar.gz::https://github.com/tiqwab/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('3c14cade2b6a5e2ff30d9f4cd5680997bfff43cacdef6cc67fcd235291bcf547')

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
