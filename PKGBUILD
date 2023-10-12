# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cloudflarespeedtest-bin
_appname=CloudflareST
pkgver=2.2.4
pkgrel=3
pkgdesc="自选优选IP测试Cloudflare CDN延迟和速度,获取最快IP(IPv4/IPv6)!另外也支持其他CDN/网站 IP"
arch=('x86_64')
url="https://github.com/XIU2/CloudflareSpeedTest"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('sh')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}_linux_amd64.tar.gz")
sha256sums=('cb9899ca526f3a7ff5fc0de745aa9a863ea8a36953abe1b50f9754c65101b3c8')
build() {
    mv "${srcdir}/使用+错误+反馈说明.txt" "${srcdir}/ReadMe.txt"
}
package() {
    install -Dm755 "${srcdir}/cfst_hosts.sh" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_appname}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/"*.txt -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/cfst_hosts.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
}