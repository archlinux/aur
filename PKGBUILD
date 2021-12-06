# Maintainer: btstream<btstream@hotmail.com>
pkgname=betterbird-bin
_pkgname=betterbird
pkgver=91.4.0_bb22
_build=
pkgrel=1
pkgdesc="Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
provides=("betterbird=${pkgver}")
conflicts=()
source=(
    "https://www.betterbird.eu/downloads/${_pkgname}-${pkgver//_/-}${_build}.en-US.linux-x86_64.tar.bz2"
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
sha256sums=('8ff17c05bdf46bfa9663479c77898deb55cb9da9f19ab014757845c636c95bd4'
            'c613467d1c0826d663b406b6fe37e44127eb8c0cae23748aa8ca43a16dd32cbf')
