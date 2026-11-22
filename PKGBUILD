# Maintainer: Fangru Shao <matrixc7p@gmail.com>

pkgname=agy-switch-cli-bin
_pkgname=agy-switch-cli
pkgver=1.2.5
pkgrel=1
pkgdesc='Headless multi-account manager, quota inspector, and credential switcher for Antigravity CLI (agy)'
arch=('x86_64' 'aarch64')
url='https://github.com/MatrixC7/agy-switch-cli'
license=('CC-BY-NC-SA-4.0')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=()
optdepends=(
    'org.freedesktop.secrets: Desktop keyring storage for dual and keyring backend modes'
    'systemd: Manage background auto-switch service via daemon --install'
)
options=('!strip' '!debug')

source_x86_64=(
    "${_pkgname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
)
source_aarch64=(
    "${_pkgname}-v${pkgver}-aarch64-unknown-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-musl.tar.gz"
)
sha256sums_x86_64=('ece6fc7949e7d21506969846723de8f331084ef66c51ba64c0e2fcf0c02786f9')
sha256sums_aarch64=('1cdcc5bacfd0e6d887f90b6ea7c719391857cda97262ec55c562e61adbdecdd5')

package() {
    local _dir="${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-musl"

    install -Dm755 "${_dir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${_dir}/THIRD_PARTY_NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.txt"

    install -Dm644 "${_dir}/PROVENANCE.md" "${pkgdir}/usr/share/doc/${pkgname}/PROVENANCE.md"
    install -Dm644 "${_dir}/BUILD_MANIFEST.txt" "${pkgdir}/usr/share/doc/${pkgname}/BUILD_MANIFEST.txt"
}
