# Maintainer: Eddy <e.pedroni91 at gmail>
# Contributor: Shanto <shanto at hotmail>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-platform
pkgver=4.6.2
_pkgbuild=201611241400
pkgrel=2
pkgdesc="A minimal installation suitable for complete per-user customization with the built-in Eclipse package manager"
url="https://www.eclipse.org"
arch=("i686" "x86_64")
license=("EPL")
depends=("java-environment>=8" "unzip" "webkitgtk2" "libxtst" "hicolor-icon-theme")
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
    "ffa301055d17d24437d190deda0f1851458f7522c2a496ef7896d9bb06aaaefa2fd5457b725795a1e341cff53d5186ccba48796206ce1a0f9352950b150ea6a9"
    "71393b01c2774654e1b3348ceedd6b110c7f1b26da93da40dac653ce2103a34997ec0e9e7fd4e977d869c149d19ef39f59738717cc6762e39b0bc0e7d53df4ac"
    "34bae62e7428dec7ceb4fee73f4b5b846be1fe16e4bbd5958ef6684ae7340bda0d5bc3c6ea55c0d3fd87cadcc80f2570c2b0b85e0c60863ea139cadf5744c0c8"
)

if [ "$CARCH" = "x86_64" ]; then
    source[0]=${source/linux-gtk/linux-gtk-x86_64}
    sha512sums[0]="1e0a7c817127efbb2a7b216ab6854efce91228b606a5aa39b9176441e4341a4172657839133698ba33a3e029ac310ea7e9381a2de396b17cdd9e2496457a4c78"
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
