# Maintainer: David Schury < dasc at posteo de >
# Contributor: Luca Cesari <luca.cesari@bewq.org>
# Contributor: Stebalien

pkgname=pycarddav-git
_pkgname=pycarddav
pkgver=20150615
pkgrel=2
epoch=1
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

build() {
  cd "${srcdir}/$_pkgname/doc/man"
  make
}

package() {
  cd "${srcdir}/$_pkgname"

  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1

  # Manuals
  install -Dm644 doc/man/pycard-import.1 "$pkgdir/usr/share/man/man1/pycard-import.1"
  install -Dm644 doc/man/pycardsyncer.1 "$pkgdir/usr/share/man/man1/pycardsyncer.1"
  install -Dm644 doc/man/pc_query.1 "$pkgdir/usr/share/man/man1/pc_query.1"

  # Other
  install -Dm644 pycard.conf.sample $pkgdir/usr/share/doc/$_pkgname/pycard.conf.sample
  install -Dm644 README.rst $pkgdir/usr/share/doc/$_pkgname/README.rst
  install -Dm644 COPYING $pkgdir/usr/share/doc/$_pkgname/COPYING
}
