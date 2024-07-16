# Maintainer:

## links
# https://pypi.org/project/machine68k
# https://github.com/cnvogelg/machine68k

_module="machine68k"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.2.0
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
source+=(
  "$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.$_pkgext"
)
sha256sums+=(
  'c9fabeb17dbb8a7970b7b137bbc6674b8d4824e77f2df176a127acf8e87ee5a6'
)

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -frv "$pkgdir/$_site_packages"/{win,musashi}
}
