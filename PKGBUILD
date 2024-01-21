# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-pynput
_name=${pkgname#python-}
pkgver=1.7.6
pkgrel=2
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL-3.0-or-later')
depends=('python-xlib' 'python-six' 'python-evdev')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'setup.patch')
sha256sums=('3a5726546da54116b687785d38b1db56997ce1d28e53e8d22fc656d8b92e533c'
            'c519290a88baa3e15be4bb6cff4d665a020b9e0c8c1241749670d58a48b07e2c')

prepare() {
  cd "$_name-$pkgver"
  patch -Np1 -i $srcdir/setup.patch
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
