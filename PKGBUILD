# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ccusage
pkgver=20.0.43
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
sha256sums=('6fedc836d2609d9989373c3b0f46ab106ba9ab18a43ac3f3bbb38c382bc605df')
sha256sums_x86_64=('8d6b5823e7f1203b622bb8ffa1f403b02b12906098d6b50c9e2375abea3cbcd0')
sha256sums_aarch64=('5f90e049fc99910ad0394e652069f5fe20f0c1fc9d74bfe383378238dbdf09ec')
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
