pkgname=riichi-city-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="Riichi Mahjong client"
arch=('x86_64')
url="https://www.mahjong-jp.com"
provides=('riichi-city')
conflicts=('riichi-city')
options=(!strip)
install="${pkgname}.install"
source=("riichi-city.desktop"
        "icon.png::https://www.mahjong-jp.com/static/img/tool/download/role11/awaken_5.png"
        "riichi-city-bin-${pkgver}.zip::https://d3qgi0t347dz44.cloudfront.net/release/linuxpack/default_prod_Linux_${pkgver}.zip"
        "riichi-city-bin.install")
sha256sums=('6f667f25d34798d00d6cb733f3e01f16fa09eba3553a8aa0788bafa24d128da9'
            '796cbe29af70f4b5067cbd224b66f717d910c6102addae526afc880baebf9a61'
            'a693324d95b47f82696a8d9dc66f7368617ccac2e1837c4100bd428cf8cb7436'
            '5bde9d74e3d6137475f8acf3d55fe938dca78aecf45797af67b84ab0283c4f29')

package() {
    install -Dm644 "${srcdir}/riichi-city.desktop" "${pkgdir}/usr/share/applications/riichi-city.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/riichi-city.png"

    basedir="${pkgdir}/opt/riichi-city/"
    install -d "${basedir}" "${pkgdir}/usr/bin"
    cd "${srcdir}/default_prod_Linux_${pkgver}"
    cp -a "Mahjong-JP_Data" "${basedir}/"
    install -Dm755 Mahjong-JP.x86_64 "${basedir}/Mahjong-JP"
    ln -s "/opt/riichi-city/Mahjong-JP" "${pkgdir}/usr/bin/riichi-city"
    install -Dm644 UnityPlayer.so "${basedir}/UnityPlayer.so"
    install -Dm644 GameAssembly.so "${basedir}/GameAssembly.so"
}
