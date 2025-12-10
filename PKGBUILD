# Python package author: Standard Ebooks <standardebooks@googlegroups.com>
# Maintainer: Tassos Natsakis <7712382@eipieq.com>
# Maintainer: Standard Ebooks <admin@standardebooks.org>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>
pkgname=python-standardebooks
_name=tools
pkgver=2.10.2
pkgrel=1
pkgdesc="The toolset used to produce Standard Ebooks epub ebooks."
arch=(x86_64)
url="https://standardebooks.org"
license=(GPL3)
depends=(
  "java-runtime"
  "python-cairosvg"
  "python-chardet"
  "python-cssselect"
  "python-cssutils"
  "python-ftfy"
  "python-gitpython"
  "python-lxml"
  "python-natsort"
  "python-pillow"
  "python-psutil"
  "python-pyphen"
  "python-regex"
  "python-requests"
  "python-rich"
  "python-roman"
  "python-selenium"
  "python-setuptools"
  "python-smartypants"
  "python-tinycss2"
  "python-titlecase"
  "python-unidecode"
)
makedepends=("python-build" "python-installer" "python-wheel")

source=("${_name}-${pkgver}.tar.gz::https://github.com/standardebooks/tools/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=("SKIP")

prepare() {
  # Fix `importlib_resources` deprecation
  grep -lFR --include="*.py" "importlib_resources" "${_name}-${pkgver}" \
    | xargs -r -n 1 sed -i -e "s/importlib_resources/importlib.resources/g"
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
