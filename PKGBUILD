# Maintainer: David Schury < dasc at posteo de >
pkgname=pycarddav-git
_pkgname=pycarddav
pkgver=20150615
pkgrel=1
pkgdesc="pyCardDAV is a simple to use CardDAV CLI client"
arch=any
url="http://lostpackets.de/pycarddav/"
license=('Expat/MIT')
conflicts=('pycarddav')
provides=('pycarddav')
depends=('python2' 'python2-vobject' 'python2-requests' 'python2-lxml'
'python2-urwid' 'python2-xdg')
makedepends=('python-docutils' 'python2-distribute')
source=("git+https://github.com/geier/${_pkgname}.git")
md5sums=('SKIP')

package()  {
  cd "${srcdir}/$_pkgname"

  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1

  # create man page
  rst2man README.rst ${_pkgname}.1

  install -Dm644 ${_pkgname}.1 $pkgdir/usr/share/man/man1/$_pkgname.1
  install -Dm644 pycard.conf.sample $pkgdir/usr/share/$_pkgname/pycard.conf.sample
}
