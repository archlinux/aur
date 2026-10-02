# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=qi-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Local-first query engine CLI for AI agents and humans (BM25 + vector search)"
arch=('x86_64' 'aarch64')
url="https://github.com/itsmostafa/qi"
license=('MIT')
depends=()
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
source_x86_64=("qi-linux-amd64.tar.gz::https://github.com/itsmostafa/qi/releases/download/v${pkgver}/qi-linux-amd64.tar.gz")
sha256sums_x86_64=('1db2d892bdb25244b7e2a4bcf79044939185d4319b189973a3ec7f16fdae4396')
sha256sums_aarch64=('9103f2a1f87cf8d7ebdba946b218a2f13faea0a03a68f570ea2b14bd2b0490f2')
source_aarch64=("qi-linux-arm64.tar.gz::https://github.com/itsmostafa/qi/releases/download/v${pkgver}/qi-linux-arm64.tar.gz")

latestver() {
    gh api --paginate repos/itsmostafa/qi/releases --jq \
        '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
        sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    install -Dm755 "${srcdir}/qi" "${pkgdir}/usr/bin/qi"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
