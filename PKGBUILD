# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ccusage
pkgver=20.0.50
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
sha256sums=('2388744196256325c04ea1282a656df4282bd9cd6970943cf58f260729b92a38')
sha256sums_x86_64=('2c4b9b27fb96f97d36708cc66b00c01706744a045534c5b7fc0c04ecaefea4b2')
sha256sums_aarch64=('f15740033c664fd12c42f43fc0a949d0095164f5664fa846fe2bee9431162803')
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
