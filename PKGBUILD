# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=configuradorfnmt
pkgver=1.0.1
pkgrel=2
pkgdesc="Tool for request keys and certificates of FNMT"
arch=('x86_64')
url="https://www.sede.fnmt.gob.es/descargas/descarga-software/instalacion-software-generacion-de-claves"
license=('custom')
depends=('java-runtime')
optdepends=('icedtea-web: If the certificate renewal does not work, install this'
            'pcsclite: Use smartcard readers')
source=("${pkgname}-${pkgver}-amd64.deb::https://descargas.cert.fnmt.es/Linux/configuradorfnmt_${pkgver}-0_amd64.deb"
        "${pkgname}.desktop"
        "${pkgname}")
noextract=("${pkgname}-${pkgver}-amd64.deb")
sha256sums=('1c3af58017f2532bb9fdf661fce47c751f8cdb1ee88c6b72864ad75c6f74f338'
            'f56a7ab3fdae4cf111c789ccd6f0850638d8a3ba9b5825dd776d2474a782df93'
            '72810bbdee86003d80e694302391548cae2dc32c1eb779373cdf500c4b5f4f18')

package() {
    bsdtar -O -xf "${pkgname}-${pkgver}"*.deb data.tar.xz | bsdtar -C "${srcdir}" -xJf -

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "usr/lib/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "usr/lib/${pkgname}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}
