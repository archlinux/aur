# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_python=python
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.13.0
pkgrel=1
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('elementary' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.bz2")
sha256sums=('0235ac0a25c452454b42488bf00c5efa53c3534f8089c683f8ed35021cd8c47b')

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
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README ChangeLog
}