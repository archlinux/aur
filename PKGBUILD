# Maintainer:

_module="borgstore"
pkgname="python-$_module"
pkgver=0.3.0
pkgrel=1
pkgdesc="Borg Backup key-value store backend"
url="https://github.com/borgbackup/borgstore"
license=('BSD-3-Clause')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$url/releases/download/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('a9049f730c9e31ce9ccdfb4ff171542dbc818fd4c8484c4eb51e65addd76fe43')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
}
