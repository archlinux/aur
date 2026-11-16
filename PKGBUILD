# Maintainer: lzsnyy <710080675@qq.com>
# Contributor: zexadev (original author) <https://github.com/zexadev>

pkgname=gw2api-bin
pkgver=4.28.1
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
sha256sums_x86_64=('49a7effe89c992f2a6fd1b9d7bf9c793bb1a02be0a07cbc507821739d76f13aa')
sha256sums_aarch64=('5381763cba10ff7004fef3afec54fc52120965e62af1beaaadd4ae827ee8d0b2')

package() {
    local _arch_suffix="${CARCH/x86_64/amd64}"
    _arch_suffix="${_arch_suffix/aarch64/arm64}"
    install -Dm755 "${srcdir}/gemini-web2api-go_v${pkgver}_linux_${_arch_suffix}" "${pkgdir}/usr/bin/gw2api"
    install -Dm644 "${startdir}/gw2api.service" "${pkgdir}/usr/lib/systemd/system/gw2api.service"
    install -Dm644 "${startdir}/gw2api.conf" "${pkgdir}/etc/gw2api/gw2api.conf"
    install -Dm644 "${startdir}/gw2api.sysusers" "${pkgdir}/usr/lib/sysusers.d/gw2api.conf"
}
