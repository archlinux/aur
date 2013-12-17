# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python-efl-git
_pkgname=${pkgname%-*}
pkgver=1.8.99.r515.9089706
pkgrel=1
pkgdesc="Python bindings for the Enlightenment Foundataion Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('elementary>=1.8.99' 'python-dbus')
makedepends=('git' 'cython')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/bindings/python/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  echo $(python setup.py -V).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  
  python setup.py install --root="$pkgdir"

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
  install -Dm644 changes.html "$pkgdir/usr/share/doc/$_pkgname/changes.html"
}
