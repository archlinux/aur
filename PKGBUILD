# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ccusage
pkgver=20.0.29
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
sha256sums=('e72ca39eed5ce8b1141f79a5a7205ba51113cad5a465b571c861e1c0bb995e8e')
sha256sums_x86_64=('bfb8f3c499b7e304ff4be13e18774d7c05f885652231c581b2ae733b2ab48e6e')
sha256sums_aarch64=('3d8831b51825f5e2e5570ab4ce2c48b74c04bb1e5c2a279f7e2ab405d7ec880f')
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
