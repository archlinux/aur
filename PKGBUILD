# Maintainer: Zoe Wetzel <aur@commanderred.xyz>
# Contributor: Zoe Wetzel <aur@commanderred.xyz>
# Contributor: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

_pkgname=bundlewrap
pkgname=python-${_pkgname}
pkgver=5.2.0
pkgrel=3
pkgdesc="Config management with Python"
arch=('any')
url='https://bundlewrap.org'
license=('GPL-3.0-only')
depends=(
  'python'
  'python-bcrypt'
  'python-cryptography'
  'python-jinja'
  'python-librouteros>=3.0.0'
  'python-mako'
  'python-packaging>=25'
  'python-yaml'
  'python-requests>=1.0.0'
  'python-tomlkit'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
options=(!emptydirs)
source=("https://github.com/bundlewrap/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('33a0ab2ae946b0ea8f046c83afc98d2b30804c1f5ced4f6fe6f56841c0b4e7f1ccb255b5b1abe69b3349075561618f78880d6da25c3f7bc8474028fa2b2ae93e')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m pytest tests/unit
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
