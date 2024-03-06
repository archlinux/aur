# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=configuradorfnmt
pkgver=4.0.5
pkgrel=1
pkgdesc="Tool for request keys and certificates of FNMT"
arch=('any')
url="https://www.sede.fnmt.gob.es/descargas/descarga-software/instalacion-software-generacion-de-claves"
license=('LicenseRef-FNMT')
depends=('java-runtime>=17')
optdepends=('icedtea-web: If the certificate renewal does not work, install this')
source=("${pkgname}-${pkgver}-amd64.deb::https://descargas.cert.fnmt.es/Linux/configuradorfnmt_${pkgver}_amd64.deb"
        "${pkgname}.desktop"
        "${pkgname}")
noextract=("${pkgname}-${pkgver}-amd64.deb")
b2sums=('0bd9dd5aaf09f68757c6eb85fd5dd408827aee2881a0aba8b04c657d3fb33d1dbbdb3076e27fa0207d27403c37a80d54a3cc079dc7e0de72db722d92b93ddf61'
        '668221fb76264ab2d77d1417fec8032a498d369e7f5005c713a3b9a5244f91afd203f7644c12b4f72984634ffac897e04b32bbaf3cf7626ef81743736b9a9db2'
        '28a4fb76e9026edfc05d860a3a835744b363c289ccaf770f9a781c851f2f8345a6a925f4a74b187a427c49ae690763de1710e25db5729235c4ef4c584dc1fc49')

package() {
    bsdtar -O -xf "${pkgname}-${pkgver}"*.deb data.tar.xz | bsdtar -C "${srcdir}" -xJf -

    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "usr/lib/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "usr/lib/${pkgname}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "usr/lib/${pkgname}/bc-fips.jar" "${pkgdir}/usr/share/java/${pkgname}/bc-fips.jar"
    install -Dm644 "usr/lib/${pkgname}/bcpkix-fips.jar" "${pkgdir}/usr/share/java/${pkgname}/bcpkix-fips.jar"
    install -Dm644 "usr/share/doc/configuradorfnmt/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
