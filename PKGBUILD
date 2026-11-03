# Maintainer: lzsnyy <710080675@qq.com>
# Contributor: zexadev (original author) <https://github.com/zexadev>

pkgname=gw2api-bin
pkgver=4.27.0
pkgrel=1
pkgdesc="Reverse Google Gemini web protocol into OpenAI-compatible API. Single binary with built-in admin dashboard."
arch=('x86_64' 'aarch64')
url="https://github.com/zexadev/gemini-web2api-go"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
backup=('etc/gw2api/gw2api.conf')
install="${pkgname}.install"

source_x86_64=("${url}/releases/download/v${pkgver}/gemini-web2api-go_v${pkgver}_linux_amd64")
source_aarch64=("${url}/releases/download/v${pkgver}/gemini-web2api-go_v${pkgver}_linux_arm64")
sha256sums_x86_64=('5320ff87c6158b648c074b9ae6c700a75b672c8f7119b62e6f22b034e970cfca')
sha256sums_aarch64=('66392aa8c67151ead0f5e2baa1f686e97754f8cc54b856e3605ae1e26633af01')

package() {
    local _arch_suffix="${CARCH/x86_64/amd64}"
    _arch_suffix="${_arch_suffix/aarch64/arm64}"
    install -Dm755 "${srcdir}/gemini-web2api-go_v${pkgver}_linux_${_arch_suffix}" "${pkgdir}/usr/bin/gw2api"
    install -Dm644 "${startdir}/gw2api.service" "${pkgdir}/usr/lib/systemd/system/gw2api.service"
    install -Dm644 "${startdir}/gw2api.conf" "${pkgdir}/etc/gw2api/gw2api.conf"
    install -Dm644 "${startdir}/gw2api.sysusers" "${pkgdir}/usr/lib/sysusers.d/gw2api.conf"
}
