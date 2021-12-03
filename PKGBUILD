# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-keycloak
pkgver=0.26.1
pkgrel=2
pkgdesc='Python package providing access to the Keycloak API'
arch=('any')
url='https://github.com/marcospereirampj/python-keycloak'
license=('MIT')
depends=('python' 'python-requests' 'python-jose')
makedepends=('python' 'python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/marcospereirampj/python-keycloak/archive/refs/tags/${pkgver}.tar.gz
        fix-realm-login.patch::https://patch-diff.githubusercontent.com/raw/marcospereirampj/python-keycloak/pull/226.patch)
sha256sums=('521368115f4efde6e34f07362efb90a9ea56efc91a1bc16ae1ee0bc41ed3621e'
            '0b7c4e4c1d4ad95c1314fa3be907084568826b6050ca5e53e32c2d0f9b718092')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ${srcdir}/fix-realm-login.patch
}

build() {
  cd "$pkgname-$pkgver"

  python3 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python3 setup.py install --root="${pkgdir}" --optimize=1

  install -D -m644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${pkgname}-$pkgver"

  # requires: python-httmock
#python3 setup.py test
}
