# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="pydantic"
pkgname="python-${_name}"
pkgver=1.4
pkgrel=1
pkgdesc="Data validation using Python type hinting"
arch=("x86_64")
url="https://pydantic-docs.helpmanual.io/"
license=("MIT")
depends=("python")
makedepends=("cython")
optdepends=("python-ujson: faster JSON parsing in pure Python"
            "python-email-validation: enable email validation")
checkdepends=("python-pytest-cov" "mypy")
source=("https://github.com/samuelcolvin/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('49d8502e5c55d3bb14afa81931bb877baeb40c142e90f663b4c85383b7155be5')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  make test
  make test-examples
}
