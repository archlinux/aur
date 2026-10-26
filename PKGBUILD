# Maintainer: meanlint <meanlint@outlook.com>
pkgname=gemini-web2api-go-bin
pkgver=4.26.0
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

sha256sums_x86_64=('2c0c4cb73989a34ca76a9e75c79e0e8684c6d7abc58231c65ef1eca4c411be81')
sha256sums_aarch64=('5518a5f055e025b118d327b361f8c9f81df319132ed5e064eea191bbe129a50a')

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
