# Maintainer: Eddy <e.pedroni91 at gmail>
# Contributor: Shanto <shanto at hotmail>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-platform
pkgver=4.8
_pkgbuild=201806110500
pkgrel=1
pkgdesc="A minimal installation suitable for complete per-user customization with the built-in Eclipse package manager"
url="https://www.eclipse.org"
arch=("i686" "x86_64")
license=("EPL")
depends=("java-environment>=8" "unzip" "webkit2gtk")
optdepends=()
conflicts=("eclipse")
provides=("eclipse=$pkgver")
options=(!strip)

source=(
    "http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-${pkgver}-${_pkgbuild}/eclipse-platform-${pkgver}-linux-gtk.tar.gz&r=1"
    "eclipse.sh"
    "eclipse.desktop"
)

sha512sums=(
    "f5f407727e22b848931cf38f71b1a0c30a9778aa227c3df137dcceec2fba2ecc309cbfa8b4a660b814d2edb60f65110381497b4325781cab4d6402784139e32b"
    "71393b01c2774654e1b3348ceedd6b110c7f1b26da93da40dac653ce2103a34997ec0e9e7fd4e977d869c149d19ef39f59738717cc6762e39b0bc0e7d53df4ac"
    "0c556325621888765d8aa41187e0d2f1dcc3ce81ca20fd8fe7bb678d61e322bc8de30519962dfeefc3d707836275010b0369c5a304405c20737b622487f1fc6c"
)

if [ "$CARCH" = "x86_64" ]; then
    source[0]=${source/linux-gtk/linux-gtk-x86_64}
    sha512sums[0]="ccce2b954938479e42ef3f9b78f74b24ae4cae7499546fa4f9a55ec1849e1acfd06315d4529b11474a8b3d1142c9409c581edfa571baaf1342ab062f02467af2"
fi

package() {
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications
    
    install -m755 "${srcdir}/eclipse.sh" "${pkgdir}/usr/bin/eclipse"
    install -Dm644 "${srcdir}/eclipse.desktop" "${pkgdir}/usr/share/applications/"
    
    for _i in 16 32 48 256; do
        install -Dm644 "${srcdir}"/eclipse/plugins/org.eclipse.platform_*/eclipse${_i}.png "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/eclipse.png"
    done
    
    mv "${srcdir}/eclipse" "${pkgdir}/usr/lib/"
}
