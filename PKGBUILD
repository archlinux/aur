# Maintainer:
# Contributor: Rafael Baboni Dominiquini <rafaeldominiquini AT gmail DOT com>

_module="pyperclipimg"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.2.0
pkgrel=2
pkgdesc="Cross-platform copy and paste functions for images"
url="https://pypi.org/project/pyperclipimg/"
license=('MIT')
arch=('any')

depends=(
  'python'
  'python-pillow'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'python-poetry-core'
)

_pkgsrc="$_module-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('7934402ed7ce898e0a3b659e8cafb7c6a2faf7f9ad00069a0fe15a077aae1239')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
