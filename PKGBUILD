# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ampcode
pkgver=0.0.1780954218_ga27553
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
source_x86_64=("${pkgname}-${pkgver}-x64::https://static.ampcode.com/cli/${_amp_ver}/amp-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-arm64::https://static.ampcode.com/cli/${_amp_ver}/amp-linux-arm64")
sha256sums_x86_64=('2c9ee1e4ba1d1b7ed49c137eaeb3358a4585899ef6288212536bedf2e2fa1468')
sha256sums_aarch64=('d2a90f5c818d0baa929cf11cac25ea444ead13b4d1e89e5022fd8f006f9cde02')

latestver() {
    curl -fsS https://static.ampcode.com/cli/cli-version.txt | tr '-' '_'
}

package() {
    case "${CARCH}" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x64"   "${pkgdir}/usr/bin/amp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-${pkgver}-arm64" "${pkgdir}/usr/bin/amp" ;;
    esac
}
