# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_python=python2
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.16.0
pkgrel=1
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('elementary' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.xz")
sha256sums=('3418ca7dc38f07bf610b9dcc7ce356bc8c45247a2100679bf840f640e2744e90')

build() {
  cd $_pkgname-$pkgver

  DISABLE_CYTHON=1 \
  $_python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  DISABLE_CYTHON=1 \
  $_python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README ChangeLog
}
