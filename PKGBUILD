# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ampcode
pkgver=0.0.1795680045_g9e093e
pkgrel=1
pkgdesc="Amp CLI — Sourcegraph's agentic coding tool"
arch=('x86_64' 'aarch64')
url="https://ampcode.com"
license=('LicenseRef-proprietary')
depends=('glibc')
optdepends=('ripgrep: faster file search (amp downloads its own if missing)')
options=('!strip' '!debug')
provides=('amp')
conflicts=('amp' 'ampcode-bin')
replaces=('sourcegraph-amp')

_amp_ver=${pkgver//_/-}
# The CDN publishes only the CLI binary; the licence notice ships with the
# npm publication of the same version.
source=("${pkgname}-${pkgver}-npm.tgz::https://registry.npmjs.org/@sourcegraph/amp/-/amp-${_amp_ver}.tgz")
source_x86_64=("${pkgname}-${pkgver}-x64::https://static.ampcode.com/cli/${_amp_ver}/amp-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-arm64::https://static.ampcode.com/cli/${_amp_ver}/amp-linux-arm64")
sha256sums=('545171404f1319d113bee0ad596d3d67de9d5138aa62dca574bce014144d2fe3')
sha256sums_x86_64=('509842ae371c45c9beb1c7b51c484028d258160cccb69ec1bb7b42740cf09706')
sha256sums_aarch64=('619a8d5a6ea981d7b59a2f1029669ad48bc70958631aeafbb240d99072d424a9')

latestver() {
    curl -fsS https://static.ampcode.com/cli/cli-version.txt | tr '-' '_'
}

package() {
    case "${CARCH}" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x64"   "${pkgdir}/usr/bin/amp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-${pkgver}-arm64" "${pkgdir}/usr/bin/amp" ;;
    esac
    install -Dm644 "${srcdir}/package/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
