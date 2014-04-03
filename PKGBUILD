# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Maintainer: Pablo Olmos de Aguilera Corradini <pablo <at] glatelier (dot} org>
pkgname=gtg-bzr
pkgver=1234
pkgrel=1
pkgdesc="Personal GTD like organizer for the GNOME desktop environment. bzr version."
url="http://gtg.fritalk.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('pygtk' 'pygobject' 'python2-configobj' 'pyxdg' 'dbus-python'
'hicolor-icon-theme' 'desktop-file-utils' 'python2-gnomekeyring'
'python2-liblarch-git')
makedepends=('bzr' 'python2-gconf')
conflicts=('gtg')
install="gtg-bzr.install"
source=()
md5sums=()

_bzrtrunk=lp:gtg
_bzrmod=trunk

build() {
  cd ${srcdir}

  msg "Connecting to the server...."
  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  else
    bzr up ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting packaging..."

  cd ${srcdir}/${_bzrmod}
  python2 setup.py install --root=${pkgdir}
}

package() {
  return 0
}

# vim:set ts=2 sw=2 et:
