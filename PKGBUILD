# Maintainer:
# Contributor: Blazej Sewera <blazejok1[at]wp.pl>

_module="suntime"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=1.2.5
pkgrel=2
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
  "e4df651dfcde332f905e57da6be49a1cc696499f11853fb0395df29104274649"
)

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
