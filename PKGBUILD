# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Mantainer: Lorenzo Ferrillo <lorenzofersteam at live dot it>
_python=python
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.18.0
pkgrel=2
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
#//Requires Testing repository for now!
depends=('efl>=1.18.0' "$_python-dbus")
#depends=('elementary' "$_python-dbus") elementary is included in efl now
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
