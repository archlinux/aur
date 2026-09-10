# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ampcode
pkgver=0.0.1789060657_gbbbea4
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
sha256sums_x86_64=('54f93b82df7ff357c3ca0331294c88f696c226ebdd78bae60b7a5ea353e9bd2a')
sha256sums_aarch64=('45e1083dfa9cd06333fcecb4ba658ae42f276788f97bfacaadd8df242dff170d')

latestver() {
    curl -fsS https://static.ampcode.com/cli/cli-version.txt | tr '-' '_'
}

package() {
    case "${CARCH}" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x64"   "${pkgdir}/usr/bin/amp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-${pkgver}-arm64" "${pkgdir}/usr/bin/amp" ;;
    esac
}
