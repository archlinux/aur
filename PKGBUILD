# Maintainer: Dawson Dias <thexerothermicsclerodermoid@gmail.com>

pkgname=thesage
pkgver=0.32.3020
pkgrel=2
pkgdesc='English Dictionary and Thesaurus. A twenty-first century lexical reference system.'
arch=('x86_64')
url='https://sequencepublishing.com/1/thesage/thesage.html'
license=('unknown')
depends=('dotnet-runtime')
source=("$pkgname-$pkgver.zip::https://www.sequencepublishing.com/cgi-bin/download.cgi?burbridgelinux"
        "$pkgname.desktop"
        "$pkgname.png")
sha512sums=('5ae1d095a8dc7e705d6beacd5ef2b583b0f275d2770ce30fdf6ae415d5d7f2b8e7f491ec0791624ebac50ccb6846f21b6359612beaa27e3330ac783749a59f9c'
            '9b7449ba7b3066be4fae5696011e4ff204d2f4e77750d110d46f5bfb04c8021957eaecdad61ffbafedec0e9c638a80e8ad7fe1ee3d5dedc6d5f7b6976a8e564b'
            '0ef714c8063eaa3abe730015acbdb976dadb6acdfb583df35bcf9ef15b5a0d27e48f42fec579b416fe8552a85b721b1f7ba1915d507594d870fe411b40d78aaf')

package() {
    mkdir -p ${pkgdir}/{opt,usr/bin}
    install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    rm ${pkgname}.desktop
    rm ${pkgname}-${pkgver}.zip
    rm ${pkgname}.png
    cp -a . ${pkgdir}/opt/${pkgname}
    cat > ${pkgdir}/usr/bin/thesage << EOF
#!/bin/sh
dotnet /opt/thesage/Burbridge.dll
EOF
    chmod +x ${pkgdir}/usr/bin/thesage
}
