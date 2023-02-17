# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bincopy
pkgname=python-bincopy
pkgver=17.14.5
pkgrel=1
pkgdesc="Mangling of various file formats that conveys binary information"
arch=(any)
url="https://github.com/eerimoq/bincopy"
license=(MIT)
depends=(python-argparse-addons python-humanfriendly python-pyelftools)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('6e50f25f4549a2f12f271ffc97b1bd28fbfd457384c4a642ac46b6e29fee18682dccd0b1ff9bf7f960a0d3059ccf684d0145fc661aaf9dfefc9976cb8f74455a')
b2sums=('0ff913322344f0aeaabc7b5d0b7dacbed380b8b1aa24a75a5461f555f3643f0116140369cbbfd108ea96fe93ffd2487e8b6d57d0665cfa412b2d2a95c8f6c195')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
