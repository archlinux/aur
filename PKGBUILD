# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=mdformat
pkgdesc="CommonMark compliant Markdown formatter"
pkgver=0.7.16
pkgrel=1
arch=(any)
url="https://github.com/executablebooks/${pkgname}"
license=(MIT)
depends=(python-tomli python-markdown-it-py)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('114e4efa57a4138f52a219947e8fd5168e6bff8adb3e0a72e4a28ce76dfdaec2b8937d41f9d4c6da625707ff9d1d5e9806800e6f3929427d233b287e3d6208fe')

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
