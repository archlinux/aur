# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ccusage
pkgver=20.0.36
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
sha256sums=('c05494356e6996b59322061c71b6d348cb015c5ccbc0e88f9599eae9b0a7fb48')
sha256sums_x86_64=('67172f78ccdb32f1ac5958f41cbd9caf6ac92e6bfc23a075da1026eb516d21e2')
sha256sums_aarch64=('690976aef4ebae78f7b86eaa1c1e2b1052b978769d598d440c83839ad9a22d52')
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
