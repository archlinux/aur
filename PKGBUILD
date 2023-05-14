# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-keycloak
pkgver=2.7.0
pkgrel=1
pkgdesc='Python package providing access to the Keycloak API'
arch=('any')
url='https://github.com/marcospereirampj/python-keycloak'
license=('MIT')
depends=('python' 'python-requests' 'python-requests-toolbelt' 'python-jose' 'python-urllib3')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/marcospereirampj/python-keycloak/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('290df9db8bc8a39c1f35cc76614c49f0ec38caf8f0ad8e5e43c9e65ac8d20e9a')

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
