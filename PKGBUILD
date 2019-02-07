# Maintainer: Jason Stryker <public at jasonstryker dot com>
pkgname=runelite
pkgver=1.5.11
pkgrel=1
epoch=1
pkgdesc="Open source Old School RuneScape client."
arch=(any)
license=('BSD')
url="https://github.com/runelite/runelite"
depends=('java-runtime>=8' 'bash' 'ttf-font')
optdepends=('gvfs: enable links')
makedepends=('maven')
provides=("runelite")
conflicts=('runelite-git')
source=("${url}/archive/runelite-parent-${pkgver}.tar.gz"
        runelite        
        runelite.desktop
        runelite.png)
sha512sums=('0df76ca2f89642c3e7b074528fcbb570c14b7267e3368045d92f65a74dbdb8865d3e73db28b1bd01498a8665b55da0c70bae71afc483e055d2a9df2bf7db18bd'
            '55635de6a1b081bedbd8efc3a6eb93cdf7623a188bc262f2182c8be6bd5ae098d0c0c5d655b3322de549916ce9cfbb47ac369c481f619f396d9167d76627b19d'
            'e00339514623c2f683118f1cdba93cebbc0761fd72f31e2d139ed467b8c41a6738fd0f27ac2beba4d2caa2a365ef4cc49a43af54b13ca5a908e5fd11d03f4bc1'
            'fe73d666eec61a8ac0059a56a417d3a22ccdc0d09eb567a613469af513318f4284ee70079a4d18d74cd3423c4d75ce5bb0a3c6df9f9f4532f8d5833ffe4a34ce')

build() {
    cd ${srcdir}/${pkgname}-runelite-parent-${pkgver}/runelite-client/

    mvn clean package \
        -Dmaven.repo.local="${srcdir}/repo" \
        -DskipTests=true
        
}

package() {
        
    install -D -m644 \
        "${srcdir}/${pkgname}-runelite-parent-${pkgver}/runelite-client/target/client-${pkgver}-shaded.jar" \
        "${pkgdir}/usr/share/runelite/RuneLite.jar"

    install -D -m755 \
        "${srcdir}/runelite" \
        "${pkgdir}/usr/bin/runelite"

    install -D -m644 \
        "${srcdir}/runelite.desktop" \
        "${pkgdir}/usr/share/applications/runelite.desktop"

    install -D -m644 \
        "${srcdir}/runelite.png" \
        "${pkgdir}/usr/share/pixmaps/runelite.png"

    install -D -m644 \
        "${srcdir}/${pkgname}-runelite-parent-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}"
}
