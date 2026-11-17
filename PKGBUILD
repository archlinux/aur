# Maintainer: Toufic Majdalani <toufic@touficmajdalani.com>
pkgname=forge-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Git-based version control CLI with semantic diff and merge for 3D models, game assets, and binary formats"
arch=('x86_64' 'aarch64')
url="https://github.com/forgehubproject/forge"
license=('MIT')
provides=('forge')
conflicts=('forge')
options=(!strip)

source_x86_64=("forge-amd64::${url}/releases/download/v${pkgver}/forge_v${pkgver}_linux_amd64")
source_aarch64=("forge-arm64::${url}/releases/download/v${pkgver}/forge_v${pkgver}_linux_arm64")

sha256sums_x86_64=('833726f8c2942bcffd7a756b027c70820d08335c94bc776226f78d765ed7895a')
sha256sums_aarch64=('73db747af05edd23e583bb3b6dd8effd785b3cb0d4ee475671762249b9b7ceaa')

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
