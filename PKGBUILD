# Maintainer: tioguda <guda.flavio@gmail.com>

pkgbase=shodo
pkgname=${pkgbase}
pkgver=1.1.1
pkgrel=1
arch=('any')
pkgdesc="Assinador fornecido pela Justiça do Trabalho para realizar assinaturas digitais no PJe"
url="https://pje.csjt.jus.br/manual/index.php/Shod%C5%8D"
license=('custom')
depends=('java-runtime=8')
install=${pkgname}.install

DLAGENTS=('https::/usr/bin/curl -k -o %o %u')

source=("${pkgname}-${pkgver}.jar::https://pje.trt5.jus.br/shodo/shodo.jar"
        "${pkgbase}"-{48,64,128}.png
        "${pkgbase}")
sha256sums=('8a6ae3ad16bb592b73a6ea65f4db3ef4ece774c5ada367ba0ecc75577e2b5cff'
            '17ea4384cbc047448a6698994ae109884f7ef299b972452b6060587b0e300375'
            '11b54f2210ef5ba2fe1f0e3b388bdac2d3e67b66f549c85b2efe77e4f573a3a3'
            '68c1fa6b45b21fd1a8df30338a957b4657257ab9c8bc456a5873f8a589de9f41'
            'cc1f6d2470a6a77044f89b3f1c6d4b67d4e94746682a85851e754dfb0ebd29ed')

noextract=("${pkgname}-${pkgver}.jar")

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
    install -Dm 755 ${pkgname}-${pkgver}.jar "${pkgdir}/opt/${pkgname}/${pkgname}.jar"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for i in 48 64 128; do
        install -Dm 644 "${srcdir}/${pkgname}-${i}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
}
