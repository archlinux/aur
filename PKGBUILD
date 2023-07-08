# Maintainer: _ <_@_._>

pkgname=riichi-city-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="Competitive urban-style Japanese mahjong platform"
arch=('x86_64')
url="https://www.mahjong-jp.com"
license=('custom')
provides=('riichi-city')
conflicts=('riichi-city')
depends=('libsecret')
install="${pkgname}.install"
source=("riichi-city.desktop"
        "icon.png::https://www.mahjong-jp.com/static/img/tool/download/role11/awaken_5.png"
        "riichi-city-bin-${pkgver}.zip::https://d3qgi0t347dz44.cloudfront.net/release/linuxpack/default_prod_Linux_${pkgver}.zip"
        "riichi-city-terms.pdf"
        "riichi-city-bin.install")
sha256sums=('4f8204227f3f7548a277df299b634dc5e7e5dba4de5742c04abb5abaf49dc720'
            '796cbe29af70f4b5067cbd224b66f717d910c6102addae526afc880baebf9a61'
            'fdd8e5295f6e99bdcb85463816ce43db824dc4d869f3ba8584ea507aaf8dc652'
            'd1efb5dec4c56b1fd2d89b966e0096a2817767c3884a499ae33f116ab5f78fd5'
            '5bde9d74e3d6137475f8acf3d55fe938dca78aecf45797af67b84ab0283c4f29')

package() {
    install -Dm644 "${srcdir}/riichi-city.desktop" "${pkgdir}/usr/share/applications/riichi-city.desktop"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/riichi-city.png"
    install -Dm644 riichi-city-terms.pdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"

    basedir="${pkgdir}/opt/riichi-city/"
    install -d "${basedir}" "${pkgdir}/usr/bin"
    cd "${srcdir}/default_prod_Linux_${pkgver}"
    cp -a "Mahjong-JP_Data" "${basedir}/"
    install -Dm755 Mahjong-JP.x86_64 "${basedir}/Mahjong-JP"
    ln -s "/opt/riichi-city/Mahjong-JP" "${pkgdir}/usr/bin/riichi-city"
    install -Dm644 UnityPlayer.so "${basedir}/UnityPlayer.so"
    install -Dm644 GameAssembly.so "${basedir}/GameAssembly.so"
}
