# Maintainer:
# Contributor: KUMAX <kumax2048@pm.me>

## links
# https://pypi.org/project/pip-search/
# https://github.com/victorgarric/pip_search

_module="pip_search"
_pkgname="python-${_module//_/-}"
pkgname="$_pkgname"
pkgrel=3
pkgver=0.0.12
pkgdesc="Search for pip packages via PyPi"
url="https://github.com/victorgarric/pip_search"
arch=('any')
license=("MIT")

depends=(
  'python'
  'python-rich'
  'python-beautifulsoup4'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-setuptools: used on import error'
)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/releases/download/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('89c78c36b4907ceb8e6b6313dc8759bf9dce80fbf5ee5f1d57445ea5c5a820d7')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << END
Full license text is unavailable.  However, license is MIT according to:

https://github.com/victorgarric/pip_search/blob/9ad311c4812be6fd8e6d12dec788d4b055ef612a/setup.py#L24
END
}
