# Maintainer: Eddy <e.pedroni91 at gmail>
# Contributor: Shanto <shanto at hotmail>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-platform
pkgver=4.6.3
_pkgbuild=201703010400
pkgrel=1
pkgdesc="A minimal installation suitable for complete per-user customization with the built-in Eclipse package manager"
url="https://www.eclipse.org"
arch=("i686" "x86_64")
license=("EPL")
depends=("java-environment>=8" "unzip" "webkit2gtk" "libxtst" "hicolor-icon-theme")
optdepends=()
conflicts=("eclipse")
provides=("eclipse=$pkgver")
install=${pkgname}.install
options=(!strip)

source=(
    "http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-${pkgver}-${_pkgbuild}/eclipse-platform-${pkgver}-linux-gtk.tar.gz&r=1"
    "eclipse.sh"
    "eclipse.desktop"
)

sha512sums=(
    "199ab997bc93d164668edb66096bada2ae07f38bacd075fdcc103cd6686d61244efd8a892ee246ce1cc407aff0556704406fa2a57dfa18f36351ec4fb29144fd"
    "71393b01c2774654e1b3348ceedd6b110c7f1b26da93da40dac653ce2103a34997ec0e9e7fd4e977d869c149d19ef39f59738717cc6762e39b0bc0e7d53df4ac"
    "34bae62e7428dec7ceb4fee73f4b5b846be1fe16e4bbd5958ef6684ae7340bda0d5bc3c6ea55c0d3fd87cadcc80f2570c2b0b85e0c60863ea139cadf5744c0c8"
)

if [ "$CARCH" = "x86_64" ]; then
    source[0]=${source/linux-gtk/linux-gtk-x86_64}
    sha512sums[0]="b271af421938fa3210aca482fbe7468a2f8935d15c5ab4efc95ded76fec4ece9a83d9acec19060624412c9a75c2b23daf0d5f05c800fb4f4becc2279f7218cca"
fi

package() {
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications
    
    install -m755 "${srcdir}/eclipse.sh" "${pkgdir}/usr/bin/eclipse"
    install -Dm644 "${srcdir}/eclipse.desktop" "${pkgdir}/usr/share/applications/"
    
    for _i in 16 32 48 256; do
        install -Dm644 "${srcdir}"/eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse${_i}.png "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/eclipse.png"
    done
    
    mv "${srcdir}/eclipse" "${pkgdir}/usr/lib/"
}
