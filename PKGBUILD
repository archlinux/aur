# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ccusage
pkgver=20.0.24
pkgrel=1
pkgdesc="Analyze coding agent CLI token usage and costs from local data"
arch=('x86_64' 'aarch64')
url="https://github.com/ryoppippi/ccusage"
license=('MIT')
options=('!strip' '!debug')

_npm_base="https://registry.npmjs.org/@ccusage"
source=("${pkgname}-${pkgver}-main.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_npm_base}/ccusage-linux-x64/-/ccusage-linux-x64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_npm_base}/ccusage-linux-arm64/-/ccusage-linux-arm64-${pkgver}.tgz")
sha256sums=('69787a0aa2269cd14f3d0f41d179b80744d5384e912ee11852897ecd0bf91183')
sha256sums_x86_64=('9bb1226e847827df692ffd6696bfbead1f2dd36ee569da6ef80dfe44467ec21b')
sha256sums_aarch64=('62fd8a7218aa42313287fd7e47f8516b5251d3719df86d8f034a54a4f57c610c')
noextract=("${pkgname}-${pkgver}-main.tgz")

latestver() {
    curl -fsSL 'https://registry.npmjs.org/ccusage/latest' | jq -r '.version'
}

package() {
    install -Dm755 package/bin/ccusage "${pkgdir}/usr/bin/ccusage"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}-main.tgz" package/LICENSE > \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
