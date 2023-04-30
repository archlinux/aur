# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=pyg3t
pkgname=$_name-git
pkgver=0.5.1.r335.c6ee292
pkgrel=1
pkgdesc="Python GetText Translation Toolkit"
arch=(any)
url="https://gitlab.com/pyg3t/pyg3t"
license=('GPL3')
depends=('python-dateutil')
makedepends=('git' 'python-setuptools')
provides=($_name)
conflicts=($_name)
source=(git+${url}.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  v=$(python -c 'from pyg3t import __version__; print(__version__)')
  r="$(git rev-list --count HEAD)"
  h="$(git rev-parse --short HEAD)"
  printf "$v.r$r.$h"
}

build() {
  cd "$srcdir/$_name"
  python setup.py build
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
