# Maintainer: meanlint <meanlint@outlook.com>
pkgname=gproxy-bin
pkgver=3.0.21
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

sha256sums_x86_64=('12cdb78009cf4def6d5089b2a52273a4018941bf9594fca59493bf82f01cba54')
sha256sums_aarch64=('d91ad95a10f7afcdb4e299ec20086b244113c590d5d1f3598d1067809be9dc0f')

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
