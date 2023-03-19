pkgname=riichi-city-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Riichi Mahjong client"
arch=('x86_64')
url="https://www.mahjong-jp.com"
provides=('riichicity')
options=(!strip)
source=("riichi-city.desktop"
        "icon.png::https://www.mahjong-jp.com/static/img/tool/download/role11/awaken_5.png"
        "riichicity-bin-${pkgver}.zip::https://d3qgi0t347dz44.cloudfront.net/release/linuxpack/Linux_default_${pkgver}.zip")
sha256sums=('6f667f25d34798d00d6cb733f3e01f16fa09eba3553a8aa0788bafa24d128da9'
            '796cbe29af70f4b5067cbd224b66f717d910c6102addae526afc880baebf9a61'
            '2f1eb475c9bdd60bab843458510ce6abf4cf957f740b66f9caf1dec16ffea135')

package() {
    install -Dm644 "${srcdir}/riichi-city.desktop" "${pkgdir}/usr/share/applications/riichi-city.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/riichi-city.png"

    basedir="${pkgdir}/opt/riichi-city/"
    install -d "${basedir}" "${pkgdir}/usr/bin"
    cd "${srcdir}/Linux_default_${pkgver}"
    cp -a "Mahjong-JP_Data" "${basedir}/"
    install -Dm755 Mahjong-JP.x86_64 "${basedir}/Mahjong-JP.x86_64"
    ln -s "/opt/riichi-city/Mahjong-JP.x86_64" "${pkgdir}/usr/bin/riichi-city"
    install -Dm644 UnityPlayer.so "${basedir}/UnityPlayer.so"
    install -Dm644 GameAssembly.so "${basedir}/GameAssembly.so"
}
