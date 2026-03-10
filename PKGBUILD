# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=simplify
pkgver=1.3.0
_sdbgver=0.1.0
pkgrel=2
pkgdesc="Generic Android deobfuscator"
arch=('any')
url="https://github.com/CalebFenton/simplify"
license=('GPL-3.0-or-later')
depends=('java-runtime>=8')
options=('!debug')
source=(
    "${pkgname}"
    "sdbg"
    "${pkgname}-${pkgver}.jar::https://github.com/CalebFenton/simplify/releases/download/v${pkgver}/simplify-${pkgver}.jar"
    "sdbg-${_sdbgver}.jar::https://github.com/CalebFenton/simplify/releases/download/v${pkgver}/sdbg-${_sdbgver}.jar"
    "LICENSE.GPL::https://raw.githubusercontent.com/CalebFenton/simplify/v${pkgver}/LICENSE.GPL"
)
sha256sums=('8afa8de0114ea2ec43863eff0ef4e17047e6d6def4095348f79217e6373cae47'
            '630f92c5a34a67ffe389b074131df58279f0ff61e495b50840040efbef33b047'
            'f346d6dd064a212cea3d6cd9a22aa78ad9e81f664d2f216551467e59c52d3d31'
            '8b44beb2591d24fc63be20df2efd760084d656d21e1b493d4a3f3d0bc8d43c52'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

latestver() {
    curl -fsSL 'https://api.github.com/repos/CalebFenton/simplify/releases/latest' | jq -r '.assets[]?.name' |
        sed -nE '/^simplify-[0-9.]+\.jar$/{s/^simplify-//; s/\.jar$//; p;}'
}

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/sdbg" "${pkgdir}/usr/bin/sdbg"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "${srcdir}/sdbg-${_sdbgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/sdbg.jar"
    install -Dm644 "${srcdir}/LICENSE.GPL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
