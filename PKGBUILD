# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer : Frederik Wegner <wegnerfrederik at gmail dot com>
pkgname=python-pydeprecate
_pkgname=pydeprecate
pkgver=0.3.2
pkgrel=3
pkgdesc="Python module for deprecation documentation"
arch=('any')
url="https://github.com/Borda/pydeprecate"
license=('Apache-2.0')
depends=('python')
checkdepends=(python-scikit-learn python-pytest)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Borda/pyDeprecate/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cc49adae216e3f9bf30358cecd4eaf3cb5d61ae0379107a4e22dfae6a7e07a16')

build() {
  cd pyDeprecate-$pkgver
  python -m build --wheel --no-isolation
}
check() {
  cd pyDeprecate-$pkgver
  pytest tests/ #--tb=short
}

package() {
  cd pyDeprecate-$pkgver
  install -D -m644 LICENSE "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
