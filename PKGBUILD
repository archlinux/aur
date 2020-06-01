# Maintainer: Famiu Haque <famiuhaque@gmail.com>
pkgname=piskel-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="A free online editor for animated sprites & pixel art."
arch=('x86_64')
url="https://github.com/piskelapp/piskel"
license=('Apache')
makedepends=('unzip' 'imagemagick')
depends=('gconf' 'gtk2' 'alsa-lib' 'libxss' 'nss' 'libxtst')
conflicts=('piskel')
provides=('piskel')
options=(!strip)
source=("logo.ico::https://github.com/piskelapp/piskel/raw/master/misc/desktop/logo.ico"
    "Piskel.desktop")
sha256sums=('c2f050d7a8e779af36018947a91a4e6f613eeb1d832d96dc979565a71fe3c282'
            '193985d8343485ee4c4388432e0426d82a29437f9a3ad3fb3bbf19a3793a5f17')

prepare()
{
    wget --load-cookies /tmp/piskel_install_cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/piskel_install_cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1EFo7Ye_rl7bGNr4iehXIgFg4gn2IcWDX' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1EFo7Ye_rl7bGNr4iehXIgFg4gn2IcWDX" -O "Piskel-0.14.0-64bits.zip" && rm -rf /tmp/piskel_install_cookies.txt
    unzip -o Piskel-0.14.0-64bits.zip
}

package()
{
	install -d "${pkgdir}/opt/"
    cp -a "${srcdir}/Piskel-0.14.0-64bits" "${pkgdir}/opt/Piskel"
	chmod +r -R "${pkgdir}/opt/Piskel/"
	chmod +rx "${pkgdir}/opt/Piskel/lib/"
	chmod +x "${pkgdir}/opt/Piskel/piskel"

	install -d "${pkgdir}/usr/share/applications"
	install "${srcdir}/Piskel.desktop" "${pkgdir}/usr/share/applications"
    chmod +x "${pkgdir}/usr/share/applications/Piskel.desktop"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/Piskel/piskel" "${pkgdir}/usr/bin/piskel"

	convert "${srcdir}/logo.ico" "${srcdir}/logo.png"
	install -d "${pkgdir}/usr/share/pixmaps"
	install "${srcdir}/logo-3.png" "${pkgdir}/usr/share/pixmaps/piskel.png"
}
