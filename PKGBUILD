# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=illarion-bin
_pkgname=illarion
pkgver=1.0.0.46
pkgrel=2
pkgdesc='The Illarion Launcher that is used to download the actual game
 and start it'
arch=('x86_64')
url='https://illarion.org'
license=('GPL')
depends=('java-runtime' 'bash')
provides=('illarion')
options=('!strip')
source=("https://${_pkgname}.org/media/java/install/${_pkgname}-${pkgver}-amd64.deb"
        "${_pkgname}.desktop")
sha512sums=('ccb0b6067abf1368b7481ef31f263e251f597b7d545d12616c43f885a9afe65b777b06d0818704f03689161ff81e66a46acd53bb5d8e1641c95c53ff4ec9608f'
            'a2ef2ca5acbd5ee82f617e863411d43e4e1f4815e7ae197c9b7a27375c0069ed9f096318bfb8ea71b731b09f19a2d46b6ca1417b9e12f03b5b2640f7de529443')

package() {
    tar -xf "${srcdir}/data.tar.bz2" -C "${pkgdir}"
    rm -rf "${pkgdir}/opt/${_pkgname}/bin"
    rm -rf "${pkgdir}/opt/${_pkgname}/jre/lib/applet"

    cd "${pkgdir}"
    install -dm755 "usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/.install4j/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
