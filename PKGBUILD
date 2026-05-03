# Maintainer: Lotte V
# Contributor: Lotte V
pkgname=ultrakiss
pkgver=5.3
pkgrel=1
pkgdesc="Full featured IDE for creating, editing and viewing online KiSS sets"
arch=('any')
url="https://github.com/kisekae/UltraKiss"
license=('GPL-3.0')
groups=('ultrakiss')
depends=('java-runtime=17' 'hicolor-icon-theme' 'jre17-openjdk')
makedepends=('java-environment=17')
source=("$pkgname-$pkgver.sh::https://github.com/kisekae/${pkgname}/releases/download/V${pkgver}/${pkgname}_unix_${pkgver//./_}.sh"
		"ultrakiss.desktop")
md5sums=('8659f7e754af77a8d9b238cb4cc712ba'
         '486a3c20a3cba0e344a0f794d7afea94')
sha256sums=('b9b0c99fe4ad135f4629d1ac600b74d43cab0d36744691e6818ee543fb1e7eed'
            'a7850eda7f44532e3446dbf01c20b4d98b63ce6bd5e3cfefa00113438774d45a')

package() {
    export HOME="${srcdir}"
    mkdir -p "${srcdir}/.javaprefs"

    sh "${srcdir}/${pkgname}-${pkgver}.sh" -q \
        -dir "${pkgdir}/opt/${pkgname}" \
        -destination "${pkgdir}/opt/${pkgname}" \
        -Vinstall4j.createDesktopSymbol=false \
        -Vinstall4j.createMenuEntries=false \
        -J-Djava.util.prefs.userRoot="${srcdir}/.javaprefs" \
        -J-Djava.util.prefs.systemRoot="${srcdir}/.javaprefs" \
        -overwrite

    install -dm644 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/UltraKiss_${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${pkgdir}/opt/${pkgname}/.install4j/UltraKiss_${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

