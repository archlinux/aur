# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ralphex-bin
pkgver=0.14.0
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
sha256sums_x86_64=('55399266745db04c557976c6e496830da45910a19fdbfbf9227f41060f461801')
sha256sums_aarch64=('228926d6c3401502f84d5ad721d6cbd6e50dd588fdad6c573c372dfb567eb442')

latestver() {
    curl -fsSL "https://api.github.com/repos/umputun/ralphex/releases/latest" |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

package() {
    install -Dm755 ralphex "${pkgdir}/usr/bin/ralphex"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
