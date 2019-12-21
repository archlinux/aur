# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="pydantic"
pkgname="python-${_name}"
pkgver=1.3
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
sha256sums=('9297ac8e7398d2d0d0f5114d68698e1bc713495199f19458ec137a6be74342cf')

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
