# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgname="asf"
pkgver="2.0.2.4"
pkgrel=1
pkgdesc="Steam cards farmer."
arch=('any')
url="https://github.com/JustArchi/ArchiSteamFarm"
license=('Apache')
depends=('mono')
backup=('opt/asf/config/ASF.json')
install=${pkgname}.install
source=("https://github.com/JustArchi/ArchiSteamFarm/releases/download/${pkgver}/ASF.zip"
        "${pkgname}.sh"
        "${pkgname}-gui.sh"
        "${pkgname}.service")
sha256sums=('2bc762a2a5af2e52b3d25a9376773fe9e464d4c6ebb6701a9026d364cee2f220'
            'a5d0324c029efb1f99264e787fea26ad53953b4df59bf642bca1ffabad4027f5'
            'bae7acbddf28bef784521456dc64989a1772ddd875926781ea02b28df7dd0609'
            'afeee8eb3f1bafa1b0502ce6be43e5119ab73fdc228a49990c9087462c5464af')

package() {
    install -d -m 755 "${pkgdir}/opt/${pkgname}"
    cp -dpr --no-preserve=ownership *.exe config "${pkgdir}/opt/${pkgname}"

    install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m755 "${srcdir}/${pkgname}-gui.sh" "${pkgdir}/usr/bin/${pkgname}-gui"
    install -D -m 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    
    # disable auto-updates
    sed -i 's/"AutoUpdates": true,/"AutoUpdates": false,/g' ${pkgdir}/opt/asf/config/ASF.json
}
