# Maintainer: meanlint <meanlint@outlook.com>
pkgname=gemini-web2api-go-bin
pkgver=4.32.0
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

sha256sums_x86_64=('a0ba7b41b7b3779d0b82ee43b0a0644fc9412d4f164df7c322974885cbca13a2')
sha256sums_aarch64=('8592b7bf04897f71e2718178815c998440e8754728707e5c3425450783682f62')

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
