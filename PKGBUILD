# Maintainer:
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_module="ewmh"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.1.6
pkgrel=8
pkgdesc="Python implementation of EWMH (Extended Window Manager Hints)"
url="https://github.com/parkouss/pyewmh"
license=('LGPL-3.0-only')
arch=('any')

depends=(
  'python'
  'python-xlib'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_pkgsrc.$_pkgext")
sha256sums=('c56b093f7d575181e979bb3a7d15c34065755f811c351ff0a31fede12b09343d')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
