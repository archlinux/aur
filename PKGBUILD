# Maintainer: Matias

_pkgname=antenna-optimizer
pkgname=python-antenna-optimizer
pkgver=0.3
pkgrel=1
pkgdesc="Optimize antennas using NEC and a genetic algorithm"
arch=(any)
url="https://github.com/schlatterbeck/antenna-optimizer"
license=(BSD-2-Clause)
depends=(
  python-matplotlib
  python-numpy
  python-pgapy
  python-pynec
  python-rsclib
  python-scipy
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e9c116a7aed196e9bb08b95536745bc673ced4c06853ed58f79e473e88e128bd')

prepare() {
  cd $_pkgname-$pkgver
  sed -n '2,25s/^# //p' setup.py > LICENSE
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
