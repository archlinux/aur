# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=pycarddav
_pkgname=pyCardDAV
pkgver=0.7.0
pkgrel=1
pkgdesc="pyCardDAV is a simple to use CardDAV CLI client"
arch=any
url="http://lostpackets.de/pycarddav/"
license=('Expat/MIT')
depends=('python2' 'python2-vobject' 'python2-requests' 'python2-lxml' 'python2-urwid' 'python2-xdg')
makedepends=('python-docutils' 'python2-distribute')
source=("http://lostpackets.de/pycarddav/downloads/$_pkgname-$pkgver.tar.gz")
md5sums=('c99e1a3182c90366e3936339c4cc661b')

package()  {
  cd "${srcdir}/$_pkgname-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1

  # create man page
  rst2man README.rst ${pkgname}.1

  install -Dm644 ${pkgname}.1 $pkgdir/usr/share/man/man1/$pkgname.1
  install -Dm644 pycard.conf.sample $pkgdir/usr/share/$pkgname/pycard.conf.sample
}
