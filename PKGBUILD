# Maintainer: Eddy <e.pedroni91 at gmail>
# Contributor: Shanto <shanto at hotmail>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-platform
pkgver=4.11
_pkgbuild=201903070500
pkgrel=1
pkgdesc="A minimal installation suitable for complete per-user customization with the built-in Eclipse package manager"
url="https://www.eclipse.org"
arch=("x86_64")
license=("EPL")
depends=("java-environment>=8" "unzip" "webkit2gtk")
optdepends=()
conflicts=("eclipse")
provides=("eclipse=$pkgver")
options=(!strip)

source=(
    "http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-${pkgver}-${_pkgbuild}/eclipse-platform-${pkgver}-linux-gtk-x86_64.tar.gz&r=1"
    "eclipse.sh"
    "eclipse.desktop"
)

sha512sums=(
    "64e2f05bf6fe5267022292c099d8ec5bdb66ee4f8a6575dbf21fcba5e29450ebf8ccec269bdbacbf465cfcc8488724aa56c11d3fc994af49c9b933379bc2a586"
    "71393b01c2774654e1b3348ceedd6b110c7f1b26da93da40dac653ce2103a34997ec0e9e7fd4e977d869c149d19ef39f59738717cc6762e39b0bc0e7d53df4ac"
    "108dc86934db22a9bfddae8087f8bca9a9b8add3863bc43fefe1224bc790ab2a2c13224c61f373a8a5a34ca0b6f01a9f0c50c220c5f099eccde78d3a945db434"
)

package() {
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications
    
    install -m755 "${srcdir}/eclipse.sh" "${pkgdir}/usr/bin/eclipse"
    install -Dm644 "${srcdir}/eclipse.desktop" "${pkgdir}/usr/share/applications/"
    
    for _i in 16 32 48 256; do
        install -Dm644 "${srcdir}"/eclipse/plugins/org.eclipse.platform_*/eclipse${_i}.png "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/eclipse.png"
    done
    
    mv "${srcdir}/eclipse" "${pkgdir}/usr/lib/"
}
