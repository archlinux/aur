# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ampcode
pkgver=0.0.1794996340_gd2376a
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
sha256sums=('8ad16d9009582edbd9a12cfa7f0ee95c9e00e0d34cd98049b9693faee379b359')
sha256sums_x86_64=('735aba45c18d69902392576141bdf17e3360f17276e94adddff4b35c979cf3a3')
sha256sums_aarch64=('c5c399c8611bd75b772c17a374f0f45166fa2d6bfe7eca0b8d8a4fd58dce2c3d')

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
