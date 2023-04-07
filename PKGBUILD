# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-keycloak
pkgver=2.6.1
pkgrel=2
pkgdesc='Python package providing access to the Keycloak API'
arch=('any')
url='https://github.com/marcospereirampj/python-keycloak'
license=('MIT')
depends=('python' 'python-requests' 'python-requests-toolbelt' 'python-jose' 'python-urllib3')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/marcospereirampj/python-keycloak/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('78f13f7bba8dc0eecaea1c9070ce5c2c41df0a66a9d1fab50a523c28fc8ce8ad')

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${pkgname}-$pkgver"

  # requires: python-httmock
#python3 setup.py test
}
