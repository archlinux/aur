# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=simplify
pkgver=2.0.0
pkgrel=1
pkgdesc="Generic Android deobfuscator"
arch=('any')
url="https://github.com/CalebFenton/simplify"
license=('Apache-2.0')
depends=('java-runtime>=21')
options=('!debug')
source=(
    "${pkgname}"
    "sdbg"
    "${pkgname}-${pkgver}.jar::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar"
    "sdbg-${pkgver}.jar::${url}/releases/download/v${pkgver}/sdbg-${pkgver}.jar"
)
sha256sums=('8afa8de0114ea2ec43863eff0ef4e17047e6d6def4095348f79217e6373cae47'
            '630f92c5a34a67ffe389b074131df58279f0ff61e495b50840040efbef33b047'
            '66626b449b0528c529fc7e55ad18b05b3741f137974d170fdad14febd6ea02a0'
            'cbc04b4ff6fba5dbbd42841698fbcbc32ff44788738c0ab9bc50224efaa42c0d')

latestver() {
    gh api --paginate repos/CalebFenton/simplify/releases --jq '.[] | select(.prerelease == false and .draft == false) | .assets[]?.name' |
        sed -nE '/^simplify-[0-9.]+\.jar$/{s/^simplify-//; s/\.jar$//; p; q}'
}

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/sdbg" "${pkgdir}/usr/bin/sdbg"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "${srcdir}/sdbg-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/sdbg.jar"
}
