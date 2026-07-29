# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=configuradorfnmt
pkgver=5.1.2
pkgrel=1
pkgdesc="Tool for request keys and certificates of FNMT"
arch=('any')
url="https://www.sede.fnmt.gob.es/descargas/descarga-software/instalacion-software-generacion-de-claves"
license=('LicenseRef-FNMT')
depends=('java-runtime>=22')
optdepends=('icedtea-web: If the certificate renewal does not work, install this')
options=('!debug' '!emptydirs')
source=("${pkgname}-${pkgver}-amd64.deb::https://descargas.cert.fnmt.es/Linux/configuradorfnmt_${pkgver}.amd64.deb"
        "${pkgname}.desktop"
        "${pkgname}")
noextract=("${pkgname}-${pkgver}-amd64.deb")
b2sums=('6ceaa1b7f0b331d1beddc44d1b4bd5590877efb43a1fb4744c0a10ad98666e2826d7bc34540ce34ee2c67b2e1921267e83a433be29b8b2d3a5a164e613fe9840'
        '668221fb76264ab2d77d1417fec8032a498d369e7f5005c713a3b9a5244f91afd203f7644c12b4f72984634ffac897e04b32bbaf3cf7626ef81743736b9a9db2'
        '6218b559d57d7baaee6fd4d98546dc0a93e91dc7931f06a6e8b7fe2cad076b499ade5c731c572f5e36377e1642179b6e867b891e99fb618b5d38bc0500127aef')

package() {
    bsdtar -O -xf "${pkgname}-${pkgver}"*.deb data.tar.zst | bsdtar -C "${srcdir}" -xf -

    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "usr/lib/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "usr/lib/${pkgname}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "usr/lib/${pkgname}/bc-fips.jar" "${pkgdir}/usr/share/java/${pkgname}/bc-fips.jar"
    install -Dm644 "usr/lib/${pkgname}/bcutil-fips.jar" "${pkgdir}/usr/share/java/${pkgname}/bcutil-fips.jar"
    install -Dm644 "usr/lib/${pkgname}/bcpkix-fips.jar" "${pkgdir}/usr/share/java/${pkgname}/bcpkix-fips.jar"
    install -Dm644 "usr/share/doc/configuradorfnmt/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
