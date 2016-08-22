# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_python=python2
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.18.0
pkgrel=1
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
#//REQUIRES TESTING REPOSITORY FOR NOW!
depends=('efl>=1.18.0' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.xz")
sha256sums=('1751e119c3fc4ee842c00ae3d667d6bda88d92eff424b06a31e9407db8ee225d')

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
