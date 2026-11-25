# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ampcode
pkgver=0.0.1795636836_g0a818e
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
sha256sums=('a84eff9c3872f440e9cd3a46c06fa8fc0cc1eaffff992f3c6b9d01a901739fdf')
sha256sums_x86_64=('7606c606d00fb66d9fdef136bbc2fae480c569b748f882114d43a08630104024')
sha256sums_aarch64=('3c704d9f23feef3c93315574c0d069fb9fa727e973e465ba3c690301451c8708')

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
