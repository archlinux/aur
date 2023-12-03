# Maintainer: Posi<posi1981@gmail.com>
pkgname=betterbird-bin
_pkgname=betterbird
pkgver=115.5.1
_build=bb19
pkgrel=2
pkgdesc="EN-US // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
depends=('dbus-glib')
provides=("betterbird=${pkgver}")
conflicts=()
source=(
#    "https://www.betterbird.eu/downloads/get.php?os=linux&lang=en-US&version=release"
#    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}-replacement.en-US.linux-x86_64.tar.bz2"
    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}-build2.en-US.linux-x86_64.tar.bz2"
#    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}.en-US.linux-x86_64.tar.bz2"
    "betterbird.desktop"
)

package() {
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/${_pkgname}"
    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    ln -s /opt/$_pkgname/betterbird "$pkgdir"/usr/bin/$_pkgname

    echo     "

	  >>>>>    Please don't forget to cast a vote for this package. THANKS
	  >>>>>    https://aur.archlinux.org/packages/betterbird-bin

	  "

    #icons
    for i in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
        ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
            "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
    done
}
sha256sums=('9018d64f4d1029034c9a34b349f624addf5d0408243e271ecd8b4976b82ef110'
            'b664d5453512ba1c8a58699d106fb1248991dbae0ee44464484be0886278945b')
