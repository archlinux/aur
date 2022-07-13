# Maintainer: David Anderegg <dd.anderegg@hotmail.com>

pkgname=javafoil
pkgver=2.29
pkgrel=1
pkgdesc="Potential flow analysis using a higher order panel method."
arch=('any')
url="https://www.mh-aerotools.de/airfoils/javafoil.htm"
depends=(
    "jre-openjdk"
    "sharutils"
)
source=(
    "javafoil.patch"
    "javafoil.desktop"
    "https://www.mh-aerotools.de/airfoils/java/javafoilinstaller.sh"
)
sha256sums=(
    "b9c702c685c4b287cb1f68339428d5fdb693736d4a441a2e089dea1699e3e047"
    "5016b837af2fc1832379988aca2f6cf22b640c170f478521b4a74e3abbd9e120"
    "5978d45e8d22da30e19c6f5a21280d3509a6bd3dcddd1e49e45b26f536e7334a"
)

prepare() {
    patch --directory="$srcdir" --forward --strip=1 --input="${srcdir}/../javafoil.patch"
}

package() {
    prefix="${pkgdir}/opt/${pkgname}"

    # .desktop file
    install -Dm644 "${srcdir}/javafoil.desktop" \
	    "${pkgdir}/usr/share/applications/javafoil.desktop"
    
    # .ico file
    icotool -c icon.png > javafoil.ico
    install -Dm644 "${srcdir}/javafoil.ico" \
	    "${pkgdir}/usr/share/pixmaps/javafoil.ico"

    # Install all needed Files
    files=('javafoil.jar' 'JavaFoil.sh' 'mhclasses.jar' 'test.jfscript')
    for f in "${files[@]}" 
    do
	install -Dm644 "${srcdir}/$f" "${prefix}/$f"
    done

}
