# Maintainer: Dominik Kozaczko <dominik+aur@kozaczko.info>
pkgname=python-pytest-language-server
_pkgname=${pkgname#python-}
pkgver=0.17.0
pkgrel=1
pkgdesc="A blazingly fast Language Server Protocol (LSP) implementation for pytest."
arch=('any')
url="https://github.com/bellini666/$_pkgname"
license=('MIT')
_archive=("${_pkgname//-/_}-$pkgver")
source=("https://files.pythonhosted.org/packages/${_pkgname::1}/$_pkgname/${_archive}.tar.gz")
#    https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl
sha256sums=("685fc7174d3137b48df53828fe88156f065f680a7177ac34d7dea90702826db7")
conflicts=()
depends=(
  'python'
)
makedepends=(
  'python-maturin'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)

build() {
  cd "$_archive"
  python -m build -wn
}

package() {
  cd "$_archive"
  python -m installer -d "$pkgdir" dist/*.whl
}
