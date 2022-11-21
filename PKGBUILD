# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-openapi-spec-validator
pkgver=0.5.1
pkgrel=1
pkgdesc="OpenAPI 2.0 (aka Swagger) and OpenAPI 3 spec validator"
url="https://github.com/p1c2u/openapi-spec-validator"
license=('Apache')
arch=('any')
depends=('python38-jsonschema' 'python38-openapi-schema-validator' 'python38-yaml'
         'python38-importlib_resources' 'python38-jsonschema-spec' 'python38-lazy-object-proxy')
makedepends=('python38-build' 'python38-installer' 'python38-poetry-core')
checkdepends=('python38-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/p1c2u/openapi-spec-validator/archive/$pkgver.tar.gz")
sha512sums=('b70a2f926d889fec9d4fd26c51e1fbbeb5e75f13449d2d0205b1b7edb12ab2ba49e4cac69426f782ca3a4430c79a6de8f66b4aad2fc552bcfcf7005e866522ff')

prepare() {
  cd openapi-spec-validator-$pkgver
  sed -i '/--cov/d' pyproject.toml
}

build() {
  cd openapi-spec-validator-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd openapi-spec-validator-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd openapi-spec-validator-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
}
