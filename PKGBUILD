# Maintainer: john smith <hidden at mail dot com>
_pkgname="grive-tools"
pkgname="${_pkgname}-patched"
pkgver=1.15
pkgrel=8
pkgdesc="Grive Tools with Patch. It disables pinging to Google every 10sec, add Sync at startup if AutoSync is enabled and replace grive-setup with a simple script."
arch=('any')
url="http://www.thefanclub.co.za/how-to/ubuntu-google-drive-client-grive-and-grive-tools"
license=('GPL3')
conflicts=("${_pkgname}" "grive-indicator-git")
depends=('grive' 'libappindicator-gtk3' 'python2-pyinotify' 'python2-gobject' 'dconf' 'xdg-utils' 'libnotify')
makedepends=('patch')
source=("${_pkgname}.patch"
        "https://launchpad.net/~thefanclub/+archive/${_pkgname}/+files/${_pkgname}_${pkgver}.tar.gz"
        "grive-app-ind-error.png::https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Gnome-dialog-error.svg/48px-Gnome-dialog-error.svg.png")
sha256sums=('7b1f8a5e3643b481a191d689fefd878567df44966fc3529e150c21122207b082'
            '617f87deb6d6f590bcd652e62e7ae2cde78e0485dbbdd05b46d3cf43b8c640bb'
            'SKIP')

prepare() {
 cd ${_pkgname}
 patch -Np1 -i "${srcdir}"/${_pkgname}.patch
}

package() {
 cd ${_pkgname}
 install -dm755 "${pkgdir}"/usr/share/applications
 install -dm755 "${pkgdir}"/usr/share/${_pkgname}/icons
 cp -r usr/share/doc usr/share/glib-2.0 usr/share/locale "${pkgdir}"/usr/share
 install -m644 "${srcdir}"/grive-app-ind-error.png "${pkgdir}"/usr/share/${_pkgname}/icons
 install -m644 usr/share/applications/grive-indicator.desktop "${pkgdir}"/usr/share/applications
 install -m644 opt/thefanclub/${_pkgname}/icons/dark/grive-app-ind.svg "${pkgdir}"/usr/share/${_pkgname}/icons
 install -m644 opt/thefanclub/${_pkgname}/icons/*.png "${pkgdir}"/usr/share/${_pkgname}/icons
 install -m644 opt/thefanclub/${_pkgname}/GoogleDrive.png "${pkgdir}"/usr/share/${_pkgname}
 install -m644 opt/thefanclub/${_pkgname}/grive-indicator-autostart.desktop "${pkgdir}"/usr/share/${_pkgname}
 install -m755 opt/thefanclub/${_pkgname}/grive-indicator "${pkgdir}"/usr/share/${_pkgname}
 install -m755 opt/thefanclub/${_pkgname}/grive-setup "${pkgdir}"/usr/share/${_pkgname}
 rm "${pkgdir}"/usr/share/locale/*/LC_MESSAGES/grive-setup.mo
}
