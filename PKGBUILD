# Maintainer: lzsnyy <710080675@qq.com>
# Contributor: zexadev (original author) <https://github.com/zexadev>

pkgname=gw2api-bin
pkgver=4.27.1
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
sha256sums_x86_64=('8e0e3df2de1881e35d8ce2395be95e94e5d0653a1013be5bcab5821fa236b5ac')
sha256sums_aarch64=('e0ba98effeae4054c3571d9f0df6f0815eac03727ca0bffbc3a1a69c9a896b7a')

package() {
    local _arch_suffix="${CARCH/x86_64/amd64}"
    _arch_suffix="${_arch_suffix/aarch64/arm64}"
    install -Dm755 "${srcdir}/gemini-web2api-go_v${pkgver}_linux_${_arch_suffix}" "${pkgdir}/usr/bin/gw2api"
    install -Dm644 "${startdir}/gw2api.service" "${pkgdir}/usr/lib/systemd/system/gw2api.service"
    install -Dm644 "${startdir}/gw2api.conf" "${pkgdir}/etc/gw2api/gw2api.conf"
    install -Dm644 "${startdir}/gw2api.sysusers" "${pkgdir}/usr/lib/sysusers.d/gw2api.conf"
}
