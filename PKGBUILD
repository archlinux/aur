# Maintainer: Posi<posi1981@gmail.com>
pkgname=betterbird-de-bin
_pkgname=betterbird
pkgver=91.4.1_bb23
_build=build2
pkgrel=2
pkgdesc="GERMAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
provides=("betterbird=${pkgver}")
conflicts=()
source=(
    "https://www.betterbird.eu/downloads/${_pkgname}-${pkgver//_/-}${_build}.de.linux-x86_64.tar.bz2"
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
    for i in 16 22 24 32 48 256; do
        install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
        ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
            "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
    done
}
sha256sums=('473a0fe323ab92ec8d833661aa3d3ecb82903932cfb204924b4ba8296a6e5c7b'
            'c99879de5ec8e8f98c2436bf414c7c167762c06df0846b42bb51195d6c8a3031')

