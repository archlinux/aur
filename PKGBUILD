# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Thanks "Kimiblock Moe", all config files from "https://aur.archlinux.org/packages/cloudreve"
pkgname=cloudreve-bin
_pkgname=Cloudreve
pkgver=4.10.1
pkgrel=1
pkgdesc="🌩 Self-hosted file management and sharing system, supports multiple storage providers.(Prebuilt version)支持多家云存储驱动的公有云文件系统"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://cloudreve.org/"
_ghurl="https://github.com/cloudreve/cloudreve"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "${pkgname%-bin}.service"
    "${pkgname%-bin}-sysusers.conf"
    "${pkgname%-bin}-tmpfile.conf"
    "config.ini"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5e78a6bc0624c39ca1fb5e7733ffa8472d41540dab2e009871504c82469d0384'
            'db980acdb57e2415676b5cb39d7ecfdd595c6b007a29ecaef7c9547e72a5524c'
            '792f666cd5454e40e9a01f987e2c079c0af1d8b2a8b91a723f22ad3e01c7cd1d'
            '3145bf311d7ae94a1f00a8c78df08240fa95668d1a8eb3981ffd7fca3b70535a')
sha256sums_aarch64=('a01a8a3c2a0cce8761268ea5fe05cf320ab65c8f35383d17304a607540eedde1')
sha256sums_armv7h=('1a11cefb815ef6090dab7d4c7151d99c1f1b096284e0a32cb54f603f48f336eb')
sha256sums_x86_64=('b4d660fa8720afae6fc819110d08725f40e62d0b8ed09c1b5d4cd378be214807')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/config.ini" -t "${pkgdir}/etc/cloudreve"
    install -Dm755 -d "${pkgdir}/usr/lib/"{sysusers.d,tmpfiles.d}
    install -Dm644 "${srcdir}/${pkgname%-bin}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-bin}.conf"
    install -Dm644 "${srcdir}/${pkgname%-bin}-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
}
