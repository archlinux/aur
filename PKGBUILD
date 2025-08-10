# Maintainer: Roald Clark <roaldclark@gmail.com>

_name=renpy
_pkgname="${_name}-sdk"
pkgname="${_pkgname}-launcher"
pkgver=8.4.1.25072401
_pkgver="${pkgver%.*}"
pkgrel=1
pkgdesc="A visual novel engine"
arch=('x86_64')
url="https://github.com/${_name}/${_name}"
license=('MIT')
depends=(
    'bash'
    'gcc-libs'
    'glibc'
    'libnotify'
)
optdepends=(
    'kdialog: KDE dialog support'
    'zenity: GNOME dialog support'
)
provides=("${_name}=${_pkgver}" "${_pkgname}=${_pkgver}")
conflicts=("${_name}" "${_pkgname}")
options=('!debug' '!strip')
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.bz2::${url}/releases/download/${pkgver}/${_name}-${_pkgver}-sdk.tar.bz2"
        "${_pkgname}-launcher.sh"
        "${_name}.desktop")
b2sums=('0704da0ab85d60f6f1e6c910f93098d05ebd5e39ac7a19b899c8597fb8072efc35ed5d70b7728179c9894b873f5898652a98916cc0c80bb1f8b994d610b22320'
        '26a06ab229f67b14c7fec7dd24a9fd1fe7ba43ab0c114e5a90ac26a7fa301a59891ccf67ea2023e8b22770ccd46f9be3e07c2eee567a7627dd4ba83ccc7d88f8'
        '4ac5de6d4d234b1e2447aa19841365448ee3e357e1626bec8ea6ecfb9d70a26dca61e855a8f6c45f5c32b463cb2c28098fbd10a4271c69130f7967338777e2da')

package() {
    cd "${srcdir}/${_name}-${_pkgver}-sdk"
    install -Dm0644 launcher/game/images/window-icon.png "${pkgdir}/usr/share/icons/${_name}.png"
    install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}.tar.bz2" -t "${pkgdir}/usr/share/${_pkgname}/"
    install -Dm0755 "${srcdir}/${_pkgname}-launcher.sh" "${pkgdir}/usr/bin/${_pkgname}-launcher"
    install -Dm0644 "${srcdir}/${_name}.desktop" -t "${pkgdir}/usr/share/applications/"
}
