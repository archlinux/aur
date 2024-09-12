# Maintainer: Posi<posi1981@gmail.com>
pkgname=betterbird-ja-bin
_pkgname=betterbird
pkgver=115.15.0
_build=bb32-build2
pkgrel=2
pkgdesc="JAPANESE // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
depends=('dbus-glib')
provides=("betterbird=${pkgver}")
conflicts=('betterbird')
source=(
    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}.ja.linux-x86_64.tar.bz2"
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

	  >>>>>    このパッケージに忘れずに投票してください。 ありがとう
	  >>>>>    Kono pakkēji ni wasurezu ni tōhyō shite kudasai. Arigatō
	  >>>>>    https://aur.archlinux.org/packages/betterbird-ja-bin

	  "

    #icons
    for i in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
        ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
            "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
    done
}
sha256sums=('1b54ecee95337e19e69af50a2cfb4120aac200bbcab8d6a88bc16b7efb05346a'
            'b664d5453512ba1c8a58699d106fb1248991dbae0ee44464484be0886278945b')

