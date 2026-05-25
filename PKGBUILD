# Maintainer: Jiraya <177346249+intjiraya@users.noreply.github.com>

pkgname=constellation-bin
_pkgname=constellation
pkgver=0.1.2
pkgrel=1
pkgdesc="A local web UI to browse and resume every Claude Code chat across all your projects"
arch=('x86_64' 'aarch64')
url="https://github.com/intjiraya/constellation"
license=('MIT OR Apache-2.0')
provides=("${_pkgname}" 'cchats')
conflicts=("${_pkgname}" "${_pkgname}-git")
depends=('gcc-libs')
options=('!strip' '!debug')

# pre-built binaries from GitHub Releases
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.xz")

# regenerate after publishing the release: `updpkgsums`
sha256sums_x86_64=('4a972742afa873d4841b707a5c161d5f2034aa1aa5c7e18ec0345b9fc9420055')
sha256sums_aarch64=('117a16ea2d320b99fd6396f88458e4826b673c66b992dd7554e5cf22d6562a05')

package() {
    local _stage_x86="${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu"
    local _stage_arm="${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu"
    local _stage

    if [[ "${CARCH}" == "x86_64" ]]; then
        _stage="${_stage_x86}"
    else
        _stage="${_stage_arm}"
    fi

    install -Dm755 "${srcdir}/${_stage}/cchats" "${pkgdir}/usr/bin/cchats"
    install -Dm644 "${srcdir}/${_stage}/README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "${srcdir}/${_stage}/CHANGELOG.md"   "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
    install -Dm644 "${srcdir}/${_stage}/LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
    install -Dm644 "${srcdir}/${_stage}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}
