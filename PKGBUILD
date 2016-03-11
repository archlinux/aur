# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_python=python2
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.17.0
pkgrel=2
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('elementary' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.xz")
sha256sums=('9ea0fe0938bd4a970206b2b18f46f4d2a4fd1994e9b5f84af2d5f9fa98739179')

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
