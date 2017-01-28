# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: surefire <surefire@cryptomile.net>

pkgname=linconnect-server-git
_pkgname=${pkgname/-git/}
pkgver=2.20.r13.g3a86225
pkgrel=2
pkgdesc="LinConnect is a project to mirror all Android notifications on a Linux desktop using LibNotify."
arch=('any')
url="https://github.com/hauckwill/linconnect-server"
license=('GPL3')
depends=('python2-cherrypy' 'python2-gobject' 'python2-pybonjour' 'python2-pip') 
optdepends=('notification-daemon: if your desktop does not have built-in support notification')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/hauckwill/linconnect-server.git"
        "${_pkgname}.desktop"
        "${_pkgname}.sh")
sha256sums=('SKIP'
            '215e9366118029c24946b1274d62672f3e27c4d74668af964b51cf1ddf5ab1b4'
            '74164e45bc999c1fd1d3af592f46e3afbcba1c933baff2ecdff4c389728970cd')
install="${pkgname}.install"

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  # Install documentation
  cd "${pkgname}"
  install -m 0644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}"
  # Install files
  cd "LinConnectServer/main"
  install -m 0755 -d "${pkgdir}/usr/lib/${_pkgname}"
  install -m 0644 "index.html" "linconnect_server.py" "${pkgdir}/usr/lib/${_pkgname}"
  install -m 0755 -d "${pkgdir}/usr/bin"
  install -m 0755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  # Install launchers
  install -m 0755 -d "${pkgdir}/etc/xdg/autostart"
  install -m 0755 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/etc/xdg/autostart"
  install -m 0755 -d "${pkgdir}/usr/share/applications"
  install -m 0755 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications"
}
