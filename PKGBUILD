# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-pyarrow-hotfix
_pkgname=pyarrow_hotfix
pkgver=0.6
pkgrel=1
pkgdesc="Hotfix for PyArrow security vulnerability CVE-2023-47248"
arch=('any')
url="https://github.com/pitrou/pyarrow-hotfix"
license=('Apache-2.0')
depends=(python python-pyarrow)
checkdepends=(python-pytest)
optdepends=()
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('79d3e030f7ff890d408a100ac16d6f00b14d44a502d7897cd9fc3e3a534e9945')

build(){
  cd "$_pkgname-$pkgver"
  python -m build -wn
}

package(){
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check(){
  cd "$_pkgname-$pkgver"
  PYTHONPATH=src pytest tests
}
