# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-prance
pkgver=0.18.2
_openapi_commit=fbe62006211838a8bb7bf2433a1d15f1a5838a03
pkgrel=1
pkgdesc="Resolving Swagger/OpenAPI 2.0 and 3.0 Parser"
url="https://github.com/jfinkhaeuser/prance"
license=('custom:MITNFA')
arch=('any')
depends=('python-chardet' 'python-yaml' 'python-flex' 'python-click' 'python-requests'
         'python-six' 'python-semver')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfinkhaeuser/prance/archive/v$pkgver.tar.gz"
        "OpenAPI-Specification-$_openapi_commit.tar.gz::https://github.com/OAI/OpenAPI-Specification/archive/$_openapi_commit.tar.gz")
sha512sums=('178c020cc40e5ac35b0217678b9269f0f96584313b76cbc811814e3f3a5da3e7d10edb339ccb9a4a39bece590f2c3f04cc8b879899479eb503df7b6f66ff570b'
            'd7957f1cdaa681b4c163e6e0b35ed6b808f469c3fdbba86a5e7221bb3c0c980415dca145e7f57bcebed75624562e89a893841d17c9e0ff82df4f0ff65ffaa2ae')

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
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
