# Maintainer: tioguda <guda.flavio@gmail.com>

pkgbase=shodo
pkgname=${pkgbase}
pkgver=1.0.15
pkgrel=1
arch=('any')
pkgdesc="Assinador fornecido pela Justiça do Trabalho para realizar assinaturas digitais no PJe"
url="http://www.cnj.jus.br/wiki/index.php/PJeOffice"
license=('custom')
depends=('java-runtime=8')
install=${pkgname}.install

DLAGENTS=('https::/usr/bin/curl -k -o %o %u')

source=("https://pje.tst.jus.br/shodo/assinadorjt-latest.jar"
            "${pkgbase}"-{48,64,128}.png
            "${pkgbase}")
sha256sums=('0ae81042f0ab5e08ae09cef01256f15eabaecd1bbfc0a9ae92b19fd4bda33800'
            '17ea4384cbc047448a6698994ae109884f7ef299b972452b6060587b0e300375'
            '11b54f2210ef5ba2fe1f0e3b388bdac2d3e67b66f549c85b2efe77e4f573a3a3'
            '68c1fa6b45b21fd1a8df30338a957b4657257ab9c8bc456a5873f8a589de9f41'
            '0b18ba8af13e9c71cf472f3fce274fbf2199217ba5017853db247ac327e1378e')

noextract=(assinadorjt-latest.jar)

_shodo_desktop="[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Shodõ - Assinador Digital
Comment=Assinador fornecido pela Justiça do Trabalho para realizar assinaturas digitais no PJe
Exec=${pkgbase}
Icon=${pkgbase}
Categories=Utility;"

build() {
    cd "${srcdir}"
    echo -e "$_shodo_desktop" | tee "${pkgbase}.desktop"
}

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cd ${srcdir}

    install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 755 assinadorjt-latest.jar "${pkgdir}/opt/${pkgname}/${pkgname}.jar"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for i in 48 64 128; do
        install -Dm 644 "${srcdir}/${pkgname}-${i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
}
