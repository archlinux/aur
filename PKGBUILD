pkgname=riichi-city-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Riichi Mahjong client"
arch=('x86_64')
url="https://www.mahjong-jp.com"
provides=('riichicity')
options=(!strip)
source=("riichi-city.desktop"
        "icon.png::https://www.mahjong-jp.com/static/img/tool/download/role11/awaken_5.png"
        "riichi-city-bin-${pkgver}.zip::https://d3qgi0t347dz44.cloudfront.net/release/linuxpack/${pkgver}_default_prod_Linux.zip")
sha256sums=('6f667f25d34798d00d6cb733f3e01f16fa09eba3553a8aa0788bafa24d128da9'
            '796cbe29af70f4b5067cbd224b66f717d910c6102addae526afc880baebf9a61'
            'c73c423f756a1ef53781b9795d58b413ae8dc4679a777fa2b324ed71d25a7b00')

package() {
    install -Dm644 "${srcdir}/riichi-city.desktop" "${pkgdir}/usr/share/applications/riichi-city.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/riichi-city.png"

    basedir="${pkgdir}/opt/riichi-city/"
    install -d "${basedir}" "${pkgdir}/usr/bin"
    cd "${srcdir}/${pkgver}_default_prod_Linux"
    cp -a "Mahjong-JP_Data" "${basedir}/"
    install -Dm755 Mahjong-JP.exe "${basedir}/Mahjong-JP"
    ln -s "/opt/riichi-city/Mahjong-JP" "${pkgdir}/usr/bin/riichi-city"
    install -Dm644 UnityPlayer.so "${basedir}/UnityPlayer.so"
    install -Dm644 GameAssembly.so "${basedir}/GameAssembly.so"
}
