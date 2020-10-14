# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: mstrlu <mstrlu _at_ gmx _dot_ net>

_pkgname=ccx2
pkgname=ccx2-git
pkgver=v0.2.0.r19.g7564773
pkgrel=1
pkgdesc="Console client for xmms2 (git version)"
arch=('any')
url="https://pflouret.github.io/ccx2/"
license=('BSD')
depends=('ncurses' 'python2' 'xmms2')
optdepends=("pil: for cover art display"
            "python2-lxml: for lyrics display"
            "python2-simplejson: for lyrics display, if python < 2.6")
provides=('ccx2')
conflicts=('ccx2')
source=('git+https://github.com/pflouret/ccx2')
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  python2 setup.py build
}

package() {
  cd "$_pkgname"

  python2 setup.py install --root=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/ccx2/LICENSE"
  install -D -m644 LICENSE.urwid "$pkgdir/usr/share/licenses/ccx2/LICENSE.urwid"
}

