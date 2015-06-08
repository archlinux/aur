# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
pkgname=linux-tycoon
_pkgname=LinuxTycoon
pkgver=1.2
pkgrel=2
pkgdesc="a game where you design and manage your own distribution of Linux and compete against other Distros"
arch=('i686' 'x86_64')
url="http://lunduke.com/linux-tycoon"
license=('custom:The Greater Lunduke License')
source=("http://www.lunduke.com/dl/lt-1-linux.tar.gz"
  "http://lunduke.com/wp-content/uploads/2012/05/LinuxTycoon128.png"
  ${pkgname}.desktop
  LICENSE)
sha256sums=('394999b28806bacc738de9bf5a1d2a8dec035f425a6ca87230f4d43b8f58ae0a'
            '1e18e1e55e374b397d239e62272d39554f53836b95f05912bbae624c5d1c24b6'
            '15a5a31de5c8e1a3462a1d755b951fb35743f13507d377dcd5f74f93b33476de'
            'f4e3b8dc77414be6fbdb9751db015b06f83c0c42ab015f5f576a8573b9adbd7f')
optdepends=(gtkhtml3 libgnomeprint)

if [[ $CARCH = 'i686' ]]; then
    depends=(gtk2 expat glib2)
elif [[ $CARCH = 'x86_64' ]]; then
    depends=(lib32-gtk2 lib32-expat lib32-glib2)
fi

package() {
    mkdir -p "${pkgdir}/opt/${_pkgname}" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt/"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LinuxTycoon128.png" "${pkgdir}/usr/share/pixmaps/LinuxTycoon.png"
    install -Dm644 ${srcdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
