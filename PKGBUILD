# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=thesage
pkgver=0.40.3028
pkgrel=1
pkgdesc='English Dictionary and Thesaurus. A twenty-first century lexical reference system.'
arch=('x86_64')
url='https://www.sequencepublishing.com/1/burbridge/beta_linux.html'
license=('All Rights Reserved')
depends=('zlib' 'bash')
options=(!strip)
source=("$pkgname-$pkgver.zip::https://www.sequencepublishing.com/cgi-bin/download.cgi?burbridgelinux"
        "$pkgname.desktop"
        "$pkgname.png")
sha512sums=('aceeab22fadc9e8b1e8255bb7204df1fde329725d86d76256464ac43563e7280407ab1528d6c9f43301998104e4188e04f2a192afb51e0ed23e659e3e858f2fd'
            '9b7449ba7b3066be4fae5696011e4ff204d2f4e77750d110d46f5bfb04c8021957eaecdad61ffbafedec0e9c638a80e8ad7fe1ee3d5dedc6d5f7b6976a8e564b'
            '0ef714c8063eaa3abe730015acbdb976dadb6acdfb583df35bcf9ef15b5a0d27e48f42fec579b416fe8552a85b721b1f7ba1915d507594d870fe411b40d78aaf')

package() {
    cd "${pkgdir}"

    install -dm777 "opt/${pkgname}"
    install -dm755 "usr/bin"

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    rm "${srcdir}/${pkgname}-${pkgver}.zip"
    rm "${srcdir}/${pkgname}.desktop"
    rm "${srcdir}/${pkgname}.png"
    rm "${srcdir}/burbridge.ico"

    cp -a "${srcdir}/"* "${pkgdir}/opt/${pkgname}"

    cat > "${pkgdir}/usr/bin/thesage" << EOF
#!/bin/sh
/opt/thesage/Burbridge.exe
EOF
    chmod +x "${pkgdir}/usr/bin/thesage"
}
