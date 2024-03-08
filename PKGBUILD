# Maintainer: Posi<posi1981@gmail.com>
pkgname=betterbird-de-bin
_pkgname=betterbird
pkgver=115.8.1
_build=bb25
pkgrel=1
pkgdesc="GERMAN // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
depends=('dbus-glib' 'hunspell')
optdepends=('hunspell-de')
provides=("betterbird=${pkgver}")
conflicts=('betterbird')
source=(
#    "https://www.betterbird.eu/downloads/get.php?os=linux&lang=de&version=release"
#    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}-replacement.de.linux-x86_64.tar.bz2"
#    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}-build2.de.linux-x86_64.tar.bz2"
    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}.de.linux-x86_64.tar.bz2"
    "betterbird.desktop"
    "vendor-prefs.js"
)

package() {
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/${_pkgname}"
    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -m644 "${srcdir}/vendor-prefs.js" -t "${pkgdir}/opt/${_pkgname}/defaults/pref"
    ln -s /opt/$_pkgname/betterbird "$pkgdir"/usr/bin/$_pkgname
    ln -s /usr/share/hunspell "${pkgdir}/opt/${_pkgname}/dictionaries"

    echo     "

	  >>>>>    Bitte nicht vergessen eine Stimme für dieses Paket abzugeben. DANKE
	  >>>>>    https://aur.archlinux.org/packages/betterbird-de-bin

	  "

    #icons
    for i in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
        ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
            "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
    done
}
sha256sums=('b4276c23cac0fcae0e04b74f74f5c31cfb771d1c52c63c068f34613a6f8087d7'
            'b664d5453512ba1c8a58699d106fb1248991dbae0ee44464484be0886278945b'
            'b11745416d2b2f8bac1ccd3dcb99411c7239b067adf9eb973903c448f8747d09')

