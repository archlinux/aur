# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-prance
pkgver=0.22.11.04.0
_openapi_commit=0f9d3ec7c033fef184ec54e1ffc201b2d61ce023
pkgrel=2
pkgdesc="Resolving Swagger/OpenAPI 2.0 and 3.0 Parser"
url="https://github.com/jfinkhaeuser/prance"
license=('custom:MITNFA')
arch=('any')
depends=('python-chardet' 'python-ruamel-yaml' 'python-requests' 'python-six' 'python-semver'
         'python-packaging')
optdepends=('python-flex' 'python-click' 'python-pyicu' 'python-openapi-spec-validator')
makedepends=('python-setuptools')
# 'python-flex' is broken, removed for now: https://github.com/RonnyPfannschmidt/prance/issues/116
checkdepends=('python-pytest-cov' 'python-click' 'python-pyicu' 'python-openapi-spec-validator')
source=("https://github.com/jfinkhaeuser/prance/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/OAI/OpenAPI-Specification/archive/$_openapi_commit/OpenAPI-Specification-$_openapi_commit.tar.gz")
sha512sums=('ad2d65ec732ffe5275dd6a0e8d9bd04a6ee7c7d6d46f4cbf680be344c6593334ea98436b0a99bc773b6705d948f331930a921d1704cdab59cf07ee5da2cfe48c'
            'c75ff7410c75ce23fd736ccb4294175438b66a954687d380124c0e37237112b043fa0c289269a8d792e8385264c923b0be09d6bf63112a106e4579d9d7a9808f')

prepare() {
  rmdir prance-$pkgver/tests/OpenAPI-Specification
  ln -s "$srcdir"/OpenAPI-Specification-$_openapi_commit prance-$pkgver/tests/OpenAPI-Specification
}

build() {
  cd prance-$pkgver
  python setup.py build
}

check() {
  cd prance-$pkgver
  pytest
}

package() {
  cd prance-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
