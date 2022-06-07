# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pylink-square
_name_=pylink
pkgname=python-pylink-square
pkgver=0.13.0
pkgrel=1
pkgdesc="Python interface for the SEGGER J-Link"
arch=(any)
url="https://github.com/Square/pylink"
license=(Apache)
depends=(python-future python-psutil python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-mock python-pytest)
conflicts=(pylink)
provides=(pylink)
replaces=(pylink)
# sdist on pypi.org has no tests: https://github.com/square/pylink/issues/119
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=($_name_-$pkgver.tar.gz::https://github.com/square/pylink/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('42878069fec6d1c9706ed5ae9b6af103d047b05e24c356b74c37cb4ed3b0e31257a66b200b087cbddb8188c4ca10c1c357e71352cc6a74a3f01790fb703860b6')
b2sums=('1350c553d2cbc6c433c7cff09455bb7e691a9786222f2ed20654b551f1e4591e3c7b6f02f59627491c8498f294d1967de6fb8c521c5aa565651df25b09cd45f5')

build() {
  cd $_name_-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name_-$pkgver
  pytest -v
}

package() {
  cd $_name_-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}
