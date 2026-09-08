# Maintainer: Toufic Majdalani <toufic@touficmajdalani.com>
pkgname=forge-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Format-aware version control CLI with semantic diff and merge for any file type"
arch=('x86_64' 'aarch64')
url="https://github.com/forgehubproject/forge"
license=('MIT')
provides=('forge')
conflicts=('forge')
options=(!strip)

source_x86_64=("forge-amd64::${url}/releases/download/v${pkgver}/forge_v${pkgver}_linux_amd64")
source_aarch64=("forge-arm64::${url}/releases/download/v${pkgver}/forge_v${pkgver}_linux_arm64")

sha256sums_x86_64=('0963d3d0aff5b04b2ec1330a8062c9fd8f210ef7be62a95bebf56e6ade3faf82')
sha256sums_aarch64=('9845c0aad154f0ef3bd08c3df6265c6752a9466d4a5699b4c5c19fbe1122b95f')

package() {
    case "$CARCH" in
        x86_64)  _src="forge-amd64" ;;
        aarch64) _src="forge-arm64" ;;
    esac
    install -Dm755 "${srcdir}/${_src}" "${pkgdir}/usr/bin/forge"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License — see https://github.com/forgehubproject/forge/blob/main/LICENSE
EOF
}
