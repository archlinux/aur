# Maintainer:

## links
# https://pypi.org/project/machine68k
# https://github.com/cnvogelg/machine68k

_module="machine68k"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.3.0
pkgrel=2
pkgdesc="Cython binding for a m68k system emulator"
url="https://github.com/cnvogelg/machine68k"
license=('GPL-2.0-only')
arch=('x86_64')

depends=(
  'python'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.$_pkgext")
sha256sums=('40bf621b208ae402317c3bd0abb7b6ae36124a2fc416d33599f35ee337028deb')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -frv "$pkgdir/$_site_packages"/{win,musashi}
}
