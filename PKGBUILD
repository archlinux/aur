# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_python=python
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.15.0
pkgrel=1
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('elementary' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.xz")
sha256sums=('e6df2bfdedd6a070539c940c3a7dcd94e34e729dc0e80b148954b747472819e4')

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
