# Maintainer: lzsnyy <710080675@qq.com>
# Contributor: zexadev (original author) <https://github.com/zexadev>

pkgname=gw2api-bin
pkgver=4.32.0
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
sha256sums_x86_64=('a0ba7b41b7b3779d0b82ee43b0a0644fc9412d4f164df7c322974885cbca13a2')
sha256sums_aarch64=('8592b7bf04897f71e2718178815c998440e8754728707e5c3425450783682f62')

package() {
    local _arch_suffix="${CARCH/x86_64/amd64}"
    _arch_suffix="${_arch_suffix/aarch64/arm64}"
    install -Dm755 "${srcdir}/gemini-web2api-go_v${pkgver}_linux_${_arch_suffix}" "${pkgdir}/usr/bin/gw2api"
    install -Dm644 "${startdir}/gw2api.service" "${pkgdir}/usr/lib/systemd/system/gw2api.service"
    install -Dm644 "${startdir}/gw2api.conf" "${pkgdir}/etc/gw2api/gw2api.conf"
    install -Dm644 "${startdir}/gw2api.sysusers" "${pkgdir}/usr/lib/sysusers.d/gw2api.conf"
}
