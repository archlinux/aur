# Maintainer: Lotte V
# Contributor: Lotte V
pkgname=ultrakiss
pkgver=5.2
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
md5sums=('dc0e13b947d2cd35cf77a4aeb8c1b0d3'
         '486a3c20a3cba0e344a0f794d7afea94')
sha256sums=('2734328309fa5ae2d55e1287b030c4665c5d5ee5689c2cdaa6aa19ada56b7c57'
            'a7850eda7f44532e3446dbf01c20b4d98b63ce6bd5e3cfefa00113438774d45a')

package() {
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

    install -dm644 "${pkgdir}/usr/share/pixmaps"
    cp "${pkgdir}/opt/${pkgname}/.install4j/UltraKiss_${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

