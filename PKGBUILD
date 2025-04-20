# Maintainer: Jakub Klinkovský <lahwaacz cat archlinux dog org>

_name=dask-jobqueue
pkgname=python-$_name
pkgver=0.9.0
pkgrel=3
pkgdesc="Deploy Dask on job schedulers like PBS, SLURM, and SGE"
arch=(any)
url="https://github.com/dask/dask-jobqueue"
license=(BSD-3-Clause)
depends=(
  python
  python-dask
  python-distributed
  python-tornado
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=('1318a406600d85581f28793cdfef5fc22fdaf89ef008b82b56abecc3b9e313262ad3111512b9126581594d2cde1ca1c9e798f7ac819e7cea304d6b4e6df0e47d')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
