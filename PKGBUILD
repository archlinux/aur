# Maintainer: aur.chaotic.cx
# Contributor: quellen <lodgerz@gmail.com>

_pkgname="amitools"
pkgname="$_pkgname"
pkgver=0.9.1
pkgrel=1
pkgdesc="Various tools for using AmigaOS programs on other platforms"
url="https://github.com/cnvogelg/amitools"
license=('GPL-2.0-only')
arch=('any')

depends=(
  'python'
  'python-lhafile'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
optdepends=(
  'python-machine68k: cpu emulator for vamos'
)

_module="amitools"
_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.$_pkgext")
sha256sums=('a925937de0411d45f996c043843d567d82c5ee7cc56bb5ab51ff3d43e5529932')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
