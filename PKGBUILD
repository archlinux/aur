# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ralphex-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="CLI tool that orchestrates Claude Code to execute implementation plans autonomously"
arch=('x86_64' 'aarch64')
url="https://ralphex.com"
license=('MIT')
depends=('git')
optdepends=(
    'fzf: interactive plan selection'
    'ripgrep: used by review agents'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/umputun/ralphex/releases/download/v${pkgver}/ralphex_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/umputun/ralphex/releases/download/v${pkgver}/ralphex_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a7a2af9785cac483276e584719650c11b589d368b490a3fe97eb9d4cac1e3dab')
sha256sums_aarch64=('71a12db341aa11f1686f98337a801bebfb6b1dcbb77c4dc0c5a4a904559ef7a1')

latestver() {
    curl -fsSL "https://api.github.com/repos/umputun/ralphex/releases/latest" |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

package() {
    install -Dm755 ralphex "${pkgdir}/usr/bin/ralphex"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
