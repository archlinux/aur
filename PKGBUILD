# Maintainer: meanlint <meanlint@outlook.com>
pkgname=gemini-web2api-go-bin
pkgver=4.33.0
pkgrel=1
pkgdesc="Self-hosted OpenAI-compatible proxy for the Gemini web app (no API key needed), prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/zexadev/gemini-web2api-go"
license=('MIT')
provides=('gemini-web2api-go')
conflicts=('gemini-web2api-go')
options=('!strip' '!debug')
backup=('etc/gemini-web2api-go/gemini-web2api-go.env')
install="${pkgname}.install"

source_x86_64=(
    "gemini-web2api-go::https://github.com/zexadev/gemini-web2api-go/releases/download/v${pkgver}/gemini-web2api-go_v${pkgver}_linux_amd64"
)
source_aarch64=(
    "gemini-web2api-go::https://github.com/zexadev/gemini-web2api-go/releases/download/v${pkgver}/gemini-web2api-go_v${pkgver}_linux_arm64"
)

sha256sums_x86_64=('f951a441e8c0988721a006fd4a648776ad587a97139b7cc62c345bc8b7909216')
sha256sums_aarch64=('60d193930c503bd7dd6d9338e35310f60a729361905d9da2f7b7e3d48869f18b')

source=(
    "gemini-web2api-go.service"
    "gemini-web2api-go.env"
    "LICENSE::https://raw.githubusercontent.com/zexadev/gemini-web2api-go/v${pkgver}/LICENSE"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    cd "${srcdir}"

    install -Dm755 gemini-web2api-go "${pkgdir}/usr/bin/gemini-web2api-go"

    install -Dm644 gemini-web2api-go.service "${pkgdir}/usr/lib/systemd/system/gemini-web2api-go.service"
    install -Dm600 gemini-web2api-go.env "${pkgdir}/etc/gemini-web2api-go/gemini-web2api-go.env"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
