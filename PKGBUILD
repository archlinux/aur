# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Mikhaul f. Shiryaev <mr dot felixoid at gmail dot com>

_name=fints
pkgname=python-${_name}
pkgver=5.0.0
pkgrel=1
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python' 'python-mt-940' 'python-bleach' 'python-sepaxml' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=(a8a9a025158e8afee67d7f973fdb66712e056328279e1f375a0739c49c3d482e011d1915da45f390cdd09fa372d47253f8f746c000d1072a18dea9f6876e184b)

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=. pytest
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" "dist/${_name}-${pkgver}-py3-none-any.whl"
}

# vim:set ts=2 sw=2 et:
