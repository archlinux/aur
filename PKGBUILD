# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=PyFxA
pkgname=python-fxa
pkgver=0.7.9
pkgrel=1
pkgdesc='Python library for interacting with the Firefox Accounts ecosystem'
arch=('any')
url='https://github.com/mozilla/PyFxA'
license=('MPL-2.0')
depends=('python-browserid' 'python-cryptography' 'python-hawkauthlib' 'python-pyjwt' 'python-requests')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-grequests' 'python-parameterized' 'python-pyotp' 'python-pytest' 'python-responses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mozilla/$_pkgname/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dda8b33d665c3517b16c3d4f15cba50bb96070463bdb13a1c0026901ccfc1ced')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  pytest
}

package() {
  cd $_pkgname-$pkgver 
  python -m installer --destdir="$pkgdir" dist/*.whl
}
