# Maintainer: john smith <hidden at mail dot com>
pkgname="grive-indicator"
pkgver=1.15
pkgrel=2
pkgdesc="Grive Tools with Patch. It disables pinging to Google every 10sec, add Sync at startup if AutoSync is enabled, replace grive-setup with a simple script and adds a visual feedback if grive fails to sync."
arch=('any')
url="http://www.thefanclub.co.za/how-to/ubuntu-google-drive-client-grive-and-grive-tools"
license=('GPL3')
conflicts=("grive-tools" "grive-indicator-git")
depends=('grive' 'libappindicator-gtk3' 'python2-pyinotify' 'python2-gobject' 'dconf' 'xdg-utils' 'libnotify')
optdepends=('gnome-shell-extension-appindicator-git: gnome indicator support'
            'gnome-shell-extension-topicons-plus: gnome indicator support')
makedepends=('patch')
source=("grive-tools.patch"
        "https://launchpad.net/~thefanclub/+archive/grive-tools/+files/grive-tools_${pkgver}.tar.gz"
        "grive-app-ind-error.png::https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Gnome-dialog-error.svg/48px-Gnome-dialog-error.svg.png")
sha256sums=('a001cc5939df50c3228d38c5fc2fac9a32bb61ff5346ab93cf7bc1005ef03f1b'
            '617f87deb6d6f590bcd652e62e7ae2cde78e0485dbbdd05b46d3cf43b8c640bb'
            '26c2d9ef5c4cc8c14a19ac75f48b14fc09a6c4cf4a0e549d8c1f33490615e0b8')

prepare() {
 cd "${srcdir}"/grive-tools
 patch -Np1 -i "${srcdir}"/grive-tools.patch
}

package() {
 cd "${srcdir}"/grive-tools
 install -dm755 "${pkgdir}"/usr/share/applications
 install -dm755 "${pkgdir}"/usr/share/${pkgname}/icons
 cp -r usr/share/glib-2.0 usr/share/locale "${pkgdir}"/usr/share
 install -m644 "${srcdir}"/grive-app-ind-error.png "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 usr/share/applications/grive-indicator.desktop "${pkgdir}"/usr/share/applications
 install -m644 usr/share/doc/grive-tools/copyright "${pkgdir}"/usr/share/${pkgname}
 install -m644 opt/thefanclub/grive-tools/icons/dark/grive-app-ind.svg "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 opt/thefanclub/grive-tools/icons/*.png "${pkgdir}"/usr/share/${pkgname}/icons
 install -m644 opt/thefanclub/grive-tools/GoogleDrive.png "${pkgdir}"/usr/share/${pkgname}
 install -m644 opt/thefanclub/grive-tools/grive-indicator-autostart.desktop "${pkgdir}"/usr/share/${pkgname}
 install -m755 opt/thefanclub/grive-tools/grive-indicator "${pkgdir}"/usr/share/${pkgname}
 install -m755 opt/thefanclub/grive-tools/grive-setup "${pkgdir}"/usr/share/${pkgname}
 rm "${pkgdir}"/usr/share/locale/*/LC_MESSAGES/grive-setup.mo
}
