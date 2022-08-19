# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=mdformat
pkgdesc="CommonMark compliant Markdown formatter"
pkgver=0.7.15
pkgrel=1
arch=(any)
url="https://github.com/executablebooks/${pkgname}"
license=(MIT)
depends=(python-tomli python-markdown-it-py)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('38152c4132a85fab97de798035b0c0738b79212e5f1c508e462e98f39a1d722fefff4bbcf88670b37f847e96c58946f924314aaed26cffd87afed5609fa8a841')

build() {
  cd ${pkgname}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${pkgname}-${pkgver}
  PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}" python -m pytest -k 'not no_codeblock_trailing_newline and not style[default_style.md-options0]'
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
