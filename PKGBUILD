# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=qi-bin
pkgver=0.2.2
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
sha256sums_x86_64=('9acd34c7a1b198541397a4aea8b74eea52dcff630f2084f51e8990baea60bd10')
sha256sums_aarch64=('dfddbdf60e8d8a848c0355a9c8c6597400ef14ddd6b97f4ddc7107dc038b43c1')
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
