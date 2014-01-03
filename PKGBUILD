# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

_python=python
pkgname=$_python-efl-git
_pkgname=python-efl
pkgver=1.8.99.r515.9089706
pkgrel=1
pkgdesc="$_python bindings for the Enlightenment Foundataion Libraries - Development Version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('elementary>=1.8.99' "$_python-dbus")
makedepends=('git' "${_python/p/c}")
provides=("${pkgname%-*}=$pkgver")
conflicts=("${pkgname%-*}")
source=("git://git.enlightenment.org/bindings/python/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "$($_python setup.py -V).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  $_python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  
  $_python setup.py install --root="$pkgdir"

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/${pkgname%-*}/AUTHORS"
  install -Dm644 README "$pkgdir/usr/share/doc/${pkgname%-*}/README"
  install -Dm644 changes.html "$pkgdir/usr/share/doc/${pkgname%-*}/changes.html"
}
