# Maintainer: Nils Czernia <nils@czserver.de>
# Based on AUR3 paket from Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-flup-hg
_hgrepo='flup-py3.0'
pkgver=141+.916cde7b7d57+
pkgrel=1
pkgdesc="Random Python WSGI stuff"
arch=(any)
url="http://www.saddi.com/software/flup/"
license=('BSD')
depends=('python')
makedepends=('mercurial' 'python-distribute')
provides=('python-flup')
conflicts=('python-flup')
source=('hg+http://hg.saddi.com/flup-py3.0')
sha1sums=('SKIP')

pkgver() {
  cd "$_hgrepo"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$_hgrepo"

  # [HACKY] thread got renamed to _thread
  sed -i -e 's/^import thread$/import _thread/' \
      -e 's/ thread\./ _thread./g' \
      "flup/server/threadpool.py"
}

package() {
  cd "$_hgrepo"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
