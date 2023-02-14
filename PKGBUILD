# Maintainer: Posi<posi1981@gmail.com>
pkgname=betterbird-es-bin
_pkgname=betterbird
pkgver=102.8.0
_build=bb30
pkgrel=1
pkgdesc="SPANISH // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
depends=('dbus-glib')
provides=("betterbird=${pkgver}")
conflicts=('betterbird')
source=(
#	"https://www.betterbird.eu/downloads/get.php?os=linux&lang=de&version=release"
#    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}-replacement.es-AR.linux-x86_64.tar.bz2"
    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}.es-AR.linux-x86_64.tar.bz2"
    "betterbird.desktop"
)

package() {
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/${_pkgname}"
    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    ln -s /opt/$_pkgname/betterbird "$pkgdir"/usr/bin/$_pkgname

    #icons
    for i in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
        ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
            "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
    done
}
sha256sums=('ddde2d5cdb79a136911533333fef8c8bd313b28028f427cf5d92502669a3fe3f'
            'dff97ac07861d8cbbaa39b898c555d8fadf296f9abb1a25b1d4392531dd56991')

