# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ampcode
pkgver=0.0.1794729642_gc6c9b7
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
sha256sums=('d6be3edb7ecd47302a8b678d01c8e4951de8fdf6d9dc874e3cf9fb3b5ef7bba4')
sha256sums_x86_64=('a619b22204fcc3ada20fa38cf867b7287fc937e92beea2183fcc02a191aa54a0')
sha256sums_aarch64=('476cc75d0d0d67b66f17f994201882644e68164a86825c15cd4752352c25b976')

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
