# Maintainer:
# Contributor: Blazej Sewera <blazejok1[at]wp.pl>

_module="suntime"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple sunset and sunrise time calculation python library"
url="https://github.com/SatAgro/suntime"
license=("LGPL-3.0-only")
arch=("any")

depends=(
  "python"
  "python-dateutil"
  "python-six"
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_pkgsrc.$_pkgext"
)
sha256sums=(
  "be1a6cf802c916fb103bc1b923caf1bc5406178599eb90cb70ac3b90405f0866"
)

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
