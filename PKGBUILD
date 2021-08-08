# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=grayskull
pkgver=0.8.5
pkgrel=2
pkgdesc="Recipe generator for Conda"
arch=(x86_64)
url="https://github.com/conda-incubator/grayskull"
license=(Apache)
depends=(
python
python-numpy
python-pytest
python-pytest-cov
python-setuptools
python-pip
python-rapidfuzz
python-colorama
python-requests
)
makedepends=(
python
python-build
python-pip
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/conda-incubator/grayskull/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ba8d7806a44cda2c7845a7557b8ca5ba412cd59f67ec7d06d1a2c8fcaeabc8bd')

prepare() {
  cd grayskull-${pkgver}
  sed "/use_scm_version={/c\version = \"${pkgver}\"," -i setup.py
}

build() {
  cd grayskull-${pkgver}
  python -m build
}

package() {
  cd grayskull-${pkgver}
  python -m pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
  find "${pkgdir}" -type d -name "tests" -prune -exec rm -rf "{}" \;  # do not install tests
}
