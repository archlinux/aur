# Maintainer: sukanka <su975853527 AT gmail dot com>
# Maintainer: devome <evinedeng@hotmail.com>

pkgname=citespace
pkgver=6.3.1
pkgrel=1
pkgdesc="A widely used tool for visual exploration of scientific literature."
arch=('any')
url="https://citespace.podia.com"
license=('unknown')
depends=('java-runtime>=11.0.11')
makedepends=('p7zip' 'libicns')
optdepends=('mysql: for data cleansing')
source=("${pkgname}-${pkgver}.dmg::${url}/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBLytjbHc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--d31a60a35531492e0e73b8348f8b1640dcf462fd/CiteSpace-${pkgver}.dmg?disposition=attachment"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('b328fbdb644dd8fc09fcfc0c179c84cb4f2e2654bb633fc768a6243c9cdcb774'
            '5256f6866d830da93fd5439d45ae8b35f45806d19e7c86830e8d2db07fa5c83d'
            '1956b9cf79dc93834adcdff147337bbdbe9810074997e2e89c31073025baa902')

prepare() {
    7z x "${pkgname}-${pkgver}.dmg"
    mv CiteSpace/CiteSpace.app/Contents/app/*.jar "${pkgname}.jar"
    mv CiteSpace/CiteSpace.app/Contents/Resources/*.icns "${pkgname}.icns"
    icns2png -x "${pkgname}.icns"
    mv *.png "${pkgname}.png"
}

package(){
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgname}.jar"     "${pkgdir}/usr/share/java/${pkgname}.jar"
    install -Dm644 "${pkgname}.png"     "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm755 "${pkgname}.sh"      "${pkgdir}/usr/bin/${pkgname}"
}
