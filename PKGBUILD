# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Thanks "Kimiblock Moe", all config files from "https://aur.archlinux.org/packages/cloudreve"
pkgname=cloudreve-bin
_pkgname=Cloudreve
pkgver=4.14.1
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
    "config.ini"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5e78a6bc0624c39ca1fb5e7733ffa8472d41540dab2e009871504c82469d0384'
            '3145bf311d7ae94a1f00a8c78df08240fa95668d1a8eb3981ffd7fca3b70535a')
sha256sums_aarch64=('6939f9ba55646372b30debafbb95235e77979db5b3a334ae919f0af273312ee7')
sha256sums_armv7h=('72d9667bac124f84a84e441ac106c4da6821d6a54625b3dc6452c881c4537e46')
sha256sums_x86_64=('f8060a8b81c5889cae26da971c4334950fac3b97bb6429936371259874eeab82')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/config.ini" -t "${pkgdir}/etc/cloudreve"
    install -Dm755 -d "${pkgdir}/usr/lib/"{sysusers.d,tmpfiles.d}
    echo 'u	cloudreve	-	"Cloudreve User"	/var/lib/cloudreve' > "${pkgdir}/usr/lib/sysusers.d/${pkgname%-bin}.conf"
    echo 'd	/var/lib/cloudreve	0700	cloudreve	cloudreve	-' > "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
}
