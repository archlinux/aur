# Maintainer: meanlint <meanlint@outlook.com>
pkgname=gproxy-bin
pkgver=4.2.1
pkgrel=1
pkgdesc="Self-hosted LLM API gateway (OpenAI/Claude/Gemini-compatible), prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/LeenHawk/gproxy"
license=('AGPL3')
provides=('gproxy')
conflicts=('gproxy')
options=('!strip' '!debug')
backup=('etc/gproxy/gproxy.env')
install="${pkgname}.install"

source_x86_64=(
    "gproxy-linux-x86_64-${pkgver}.zip::https://github.com/LeenHawk/gproxy/releases/download/v${pkgver}/gproxy-linux-x86_64.zip"
)
source_aarch64=(
    "gproxy-linux-aarch64-${pkgver}.zip::https://github.com/LeenHawk/gproxy/releases/download/v${pkgver}/gproxy-linux-aarch64.zip"
)

sha256sums_x86_64=('689f7739590e961529885c9e9667061334b8ef68c32b057cd716937de111701c')
sha256sums_aarch64=('67dd72d5303ca0f41367947cf98aabada4c305ccf28b62ad25bbb8de65d89ec1')

source=(
    "gproxy.service"
    "gproxy.env"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

package() {
    cd "${srcdir}"

    install -Dm755 gproxy "${pkgdir}/usr/bin/gproxy"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 gproxy.service "${pkgdir}/usr/lib/systemd/system/gproxy.service"
    install -Dm600 gproxy.env "${pkgdir}/etc/gproxy/gproxy.env"
}
