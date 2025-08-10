# Maintainer: NourEddine Yassine <NourEddineX at protonmail dot com>
# Contributor: KUMAX <kumax2048@pm.me>

## links
# https://pypi.org/project/pip-search/
# https://github.com/victorgarric/pip_search

_module="pip_search"
_pkgname="python-${_module//_/-}"
pkgname="$_pkgname"
pkgrel=1
pkgver=0.0.14
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
source=("$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.$_pkgext")
sha256sums=('2d20b923162d01a0d151e172eaa42bc7465d11d2db8eb87c756753bc1a854436')

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
