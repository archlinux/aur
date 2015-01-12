# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_python=python
_pkgname=python-efl
pkgname=$_python-efl-git
pkgver=1.12.99a771.132b772
pkgrel=1
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries - Development Version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=("elementary>=${pkgver%%a*}" "$_python-dbus")
makedepends=('git' "${_python/p/c}")
provides=("${pkgname%-*}=$pkgver")
conflicts=("${pkgname%-*}")
source=("git://git.enlightenment.org/bindings/python/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "$($_python setup.py -V).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  $_python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"

  $_python setup.py install --root="$pkgdir" --optimize=1

# install text files
  install -d "$pkgdir/usr/share/doc/${pkgname%-*}/"
  install -m644 -t "$pkgdir/usr/share/doc/${pkgname%-*}/" AUTHORS README ChangeLog
}
