# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
pkgname=python-duckling
pkgdesc="Python wrapper for wit.ai's Duckling Clojure library"
pkgver=1.8.0
pkgrel=2
url="https://github.com/FraBle/${pkgname}"
license=('Apache')
arch=("any")
depends=(java-environment python-jpype1)
makedepends=(python-pytest-runner)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9aa59d55cd546b977d86987c68676d3ed38d2a902d74bd67960c23e5f8d4a41e893f3ef495d15862a9b18cc839a1fce07f490caa96c5a3f6a86ffcf4e69f27fa')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
