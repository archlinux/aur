# Maintainer: meanlint <meanlint@outlook.com>
pkgname=gproxy-bin
pkgver=4.1.1
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

sha256sums_x86_64=('c91feb789ca6a30707cb9b7385f6040e7624a5d2641d2131a16d83e8f1bc0b97')
sha256sums_aarch64=('ff47a499545e2b3bd5ff2d54feef59e9f41badd3cc2a063bddba05fdf59eae84')

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
