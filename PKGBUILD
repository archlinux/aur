# Maintainer: meanlint <meanlint@outlook.com>
pkgname=gproxy-bin
pkgver=4.1.3
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

sha256sums_x86_64=('043fce8d3441da712eb345bfed372c9f900219988fcb6572a22c3d80e29c8f5f')
sha256sums_aarch64=('3bec8ba6e5e447ce70e83c53e61149aad8be98cfcb05d0ea782972dc8b250f08')

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
