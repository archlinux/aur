# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="pydantic"
pkgname="python-${_name}"
pkgver=1.5.1
pkgrel=2
pkgdesc="Data validation using Python type hinting"
arch=("x86_64")
url="https://pydantic-docs.helpmanual.io/"
license=("MIT")
depends=("python")
makedepends=("cython")
optdepends=("python-ujson: faster JSON parsing in pure Python"
            "python-email-validator: enable email validation")
checkdepends=("python-pytest-cov" "mypy")
source=("https://github.com/samuelcolvin/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('3cb8fa09fe301ffb19f1d35e41dde95ad72e7c7649b8cb6689aedea13c5dc41f')

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
