# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ampcode
pkgver=0.0.1795708844_gca33db
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
sha256sums=('3342218ea8bd5b096c87bdd1f4c7e54ab90167f216339e869b5353c9e2119281')
sha256sums_x86_64=('ce1c3209a7a966c366649d5425e8e29f53b348a435cc6458a3891bab132cc76f')
sha256sums_aarch64=('ef13199e90d24aa45252f4af6645d05abd56998d1290f3587723e4dc3b86a7b8')

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
