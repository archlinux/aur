# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_python=python
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.11.0
pkgrel=2
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('elementary' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.xz")
sha1sums=('7007178fedc5f7eb0ee5886e63ba0e533cfe86f0')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  DISABLE_CYTHON=1 \
  $_python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  DISABLE_CYTHON=1 \
  $_python setup.py install --root="$pkgdir" --optimize=1

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README.rst changes.html
}
