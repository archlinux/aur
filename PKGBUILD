# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gopeed-bin
_pkgname=gopeed
pkgver=1.2.3
pkgrel=3
pkgdesc="High speed downloader that supports all platforms."
arch=('x86_64')
url="https://gopeed.com/"
_githuburl="https://github.com/GopeedLab/gopeed"
license=('GPL3')
options=()
providers=(GopeedLab)
conflicts=(gopeed)
depends=(at-spi2-core gtk3)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Gopeed-v${pkgver}-linux-amd64.deb")
sha512sums=('dc651692611357e20edc866945012c5712527882a9f384fe3e96c756eb425d0fb302d2e6702fe147700386f3a865436827f9bb91343cccbadfe6607af6d346b3')
 
package() {
    bsdtar -xf data.tar.zst -C "${pkgdir}"
    chown -R root:root "${pkgdir}/"
    mkdir -p "${pkgdir}/opt"
    mv "${pkgdir}/usr/local/lib/${_pkgname}" "${pkgdir}/opt"    
    rm -r "${pkgdir}/usr/local"
    sed 's/TryExec=/#TryExec=/g;s/Exec=/#Exec/g;s/Categories/#Categories/g' -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    echo -e "\nCategories=Network;Utility;" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    echo "Icon=${_pkgname}" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    echo "Exec=/opt/${_pkgname}/${_pkgname}" >> "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/usr/share/icons/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    rm -r "${pkgdir}/usr/share/icons/${_pkgname}.png"
}
