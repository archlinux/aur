# Maintainer: aur.chaotic.cx
# Contributor: Blazej Sewera <blazejok1[at]wp.pl>

_module="suntime"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=1.4.0
pkgrel=1
pkgdesc="Simple sunset and sunrise time calculation python library"
url="https://github.com/SatAgro/suntime"
license=("LGPL-3.0-only")
arch=("any")

depends=(
  'python'
)
checkdepends=(
  'python-dateutil'
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
sha256sums=('a9808c5d20b7d2ae0b05d8acb3f5f28737ed32c0eb7e7c8411d5e22698a29128')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
