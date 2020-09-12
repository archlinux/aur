# Maintainer: Dawson Dias <thexerothermicsclerodermoid@gmail.com>

pkgname=thesage
pkgver=0.32.3020
pkgrel=1
pkgdesc='English Dictionary and Thesaurus. A twenty-first century lexical reference system.'
arch=('x86_64')
url='https://sequencepublishing.com/1/thesage/thesage.html'
license=('unknown')
depends=('dotnet-runtime')
source=("$pkgname-$pkgver.zip::https://www.sequencepublishing.com/cgi-bin/download.cgi?burbridgelinux"
        "$pkgname.desktop")
sha512sums=('5ae1d095a8dc7e705d6beacd5ef2b583b0f275d2770ce30fdf6ae415d5d7f2b8e7f491ec0791624ebac50ccb6846f21b6359612beaa27e3330ac783749a59f9c'
            '3b22d1753de73e8a1b2f087a13391f36e7439318bf909b86c3c64ff1ce61d10fb6d8bbd26c90f4fabdcbee93e9186533899078c76dce68da559b65eadda7c2f5')

package() {
    mkdir -p ${pkgdir}/{opt,usr/bin}
    install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    rm ${pkgname}.desktop
    rm ${pkgname}-${pkgver}.zip
    cp -a . ${pkgdir}/opt/${pkgname}
    cat > ${pkgdir}/usr/bin/thesage << EOF
#!/bin/sh
dotnet /opt/thesage/Burbridge.dll
EOF
    chmod +x ${pkgdir}/usr/bin/thesage
}
