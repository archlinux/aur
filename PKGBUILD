# Maintainer: mahoshojoHCG <hcgstd@proton.me>
pkgname=certimate-bin
_pkgname=certimate
pkgver=0.4.22
pkgrel=1
pkgdesc='Self-hosted ACME tool for visual SSL certificate issuance, deployment, renewal, and monitoring (prebuilt binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/certimate-go/certimate'
license=('MIT')
depends=()
optdepends=('ca-certificates: TLS root certificates for outbound ACME requests')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=()
install="${_pkgname}.install"
options=('!strip')

source=(
    "${_pkgname}.service"
    "${_pkgname}.sysusers"
    "${_pkgname}.tmpfiles"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_amd64.zip")
sha256sums_x86_64=('b5bd5158379b05e04d045e4ffbd94bb3a488bd9e5f3e105138884a3f7936ceed')

source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_arm64.zip")
sha256sums_aarch64=('bf007c8eea0aaed8038bb9a98c591f55a8cbb8ca1cac8bec33e9babdd34db17e')

source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_armv7.zip")
sha256sums_armv7h=('c256127132fa58d2fb0797d9a15ac587c9a9b47deeb85a1af647ccc838424879')

package() {
    cd "${srcdir}"

    install -Dm0755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm0644 "${_pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm0644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm0644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

    if [[ -f LICENSE ]]; then
        install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
    if [[ -f README.md ]]; then
        install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
    if [[ -f CHANGELOG.md ]]; then
        install -Dm0644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    fi
}
