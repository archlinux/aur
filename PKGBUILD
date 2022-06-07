# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bincopy
pkgname=python-bincopy
pkgver=17.10.2
pkgrel=1
pkgdesc="Mangling of various file formats that conveys binary information"
arch=(any)
url="https://github.com/eerimoq/bincopy"
license=(MIT)
depends=(python-argparse-addons python-humanfriendly python-pyelftools)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('bdda0342271a93be6be47791b3cca64bf0c40e24b59ae6d6e92656b4dee0aa3e2f23c5b88d6ac8566fe0d8fff5e3696736ec3edb5f456c6424655bf28857021f')
b2sums=('8aa9e897f0d732217182755d2c4d3b2166dbc877d4005031af9164efe5c9fd76aeeea92a0172a9cd791dd7c926f8f724055f010605dc9c18e0c16aac24545e56')

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
