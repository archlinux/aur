# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Maintainer: Mikhaul f. Shiryaev <mr dot felixoid at gmail dot com>

_name=fints
pkgname=python-${_name}
pkgver=4.2.4
pkgrel=1
pkgdesc="Minimal pure-python FinTS (formerly known as HBCI) implementation"
arch=(any)
url="https://github.com/raphaelm/python-fints"
license=('LGPL')
depends=('python' 'python-mt-940' 'python-bleach' 'python-sepaxml' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raphaelm/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=(d5e981450d419ce3ceefb7a24d4d0b2966987ab488d1cda7640fa3c4520e2f8fbfc7b4f32d4b825d2482a39ad8e586db404dd7210105aa348265cb077b618fe0)

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
