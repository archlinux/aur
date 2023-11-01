# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=configuradorfnmt
pkgver=4.0.2
pkgrel=1
pkgdesc="Tool for request keys and certificates of FNMT"
arch=('x86_64')
url="https://www.sede.fnmt.gob.es/descargas/descarga-software/instalacion-software-generacion-de-claves"
license=('custom')
depends=('java-runtime')
optdepends=('icedtea-web: If the certificate renewal does not work, install this')
source=("${pkgname}-${pkgver}-amd64.deb::https://descargas.cert.fnmt.es/Linux/configuradorfnmt_${pkgver}_amd64.deb"
        "${pkgname}.desktop"
        "${pkgname}")
noextract=("${pkgname}-${pkgver}-amd64.deb")
sha256sums=('a43cc10bdfdf6b63b2a67a814e6cee8d31f8f36e6bdcc1318b406c2e601f1e6a'
            'f56a7ab3fdae4cf111c789ccd6f0850638d8a3ba9b5825dd776d2474a782df93'
            'ed290ae0575a051effe053fb199a27352322c2cb877191220b4f2c71d7623829')

package() {
    bsdtar -O -xf "${pkgname}-${pkgver}"*.deb data.tar.xz | bsdtar -C "${srcdir}" -xJf -

    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "usr/lib/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "usr/lib/${pkgname}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "usr/lib/${pkgname}/bc-fips.jar" "${pkgdir}/usr/share/java/${pkgname}/bc-fips.jar"
    install -Dm644 "usr/lib/${pkgname}/bcpkix-fips.jar" "${pkgdir}/usr/share/java/${pkgname}/bcpkix-fips.jar"
}
