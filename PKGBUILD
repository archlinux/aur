# Maintainer: Tobias Beeh <tobias beeh at tum de>

pkgname=eclipse-modeling-tools
pkgver=4.7.3a
pkgrel=1
pkgdesc="The eclipse IDE with the eclipse modeling tools as a standalone package (not directly interfering with a standard eclipse)"
url="https://www.eclipse.org/modeling"
arch=("x86_64")
license=("EPL")
depends=("java-environment>=8" "unzip" "webkit2gtk")
optdepends=()
options=(!strip)

source=(
    "http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/oxygen/3a/eclipse-modeling-oxygen-3a-linux-gtk-x86_64.tar.gz"
    "eclipse-modeling.sh"
    "eclipse-modeling.desktop"
)

sha512sums=(
    "c859e65bd2d824e70cec5f3b5f8617d6c59cf74ba703c3193290825577ce8d252f5530c4576df29cf1781ddc084eced762898de0ff23c0288765266dcda3696e"
#    "71393b01c2774654e1b3348ceedd6b110c7f1b26da93da40dac653ce2103a34997ec0e9e7fd4e977d869c149d19ef39f59738717cc6762e39b0bc0e7d53df4ac"
#    "0c556325621888765d8aa41187e0d2f1dcc3ce81ca20fd8fe7bb678d61e322bc8de30519962dfeefc3d707836275010b0369c5a304405c20737b622487f1fc6c"
    SKIP
    SKIP
)

package() {
    install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/applications
    
    install -m755 "${srcdir}/eclipse-modeling.sh" "${pkgdir}/usr/bin/eclipse-modeling"
    install -Dm644 "${srcdir}/eclipse-modeling.desktop" "${pkgdir}/usr/share/applications/"
    
    for _i in 16 32 48 256; do
        install -Dm644 "${srcdir}"/eclipse/plugins/org.eclipse.platform_*/eclipse${_i}.png "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/eclipse-modeling.png"
    done
    
    mv "${srcdir}/eclipse" "${pkgdir}/usr/lib/eclipse-modeling"
}
