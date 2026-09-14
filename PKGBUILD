# Maintainer: Greyson Christoforo <grey@christoforo.net>
pkgname=python-drawsvg
pkgver=2.4.2
pkgrel=1
pkgdesc="Programmatically generate SVG (vector) images"
arch=('any')
url="https://github.com/cduck/drawSvg"
license=('MIT')
depends=(
python-numpy
python-imageio
python-cairosvg
)
makedepends=(
python-build
python-installer
python-wheel
python-setuptools
)

source=("https://github.com/cduck/drawSvg/archive/${pkgver}.tar.gz")
b2sums=('9fe76780e6b2c5e4f3a009d30791988ab2c470c2d75d19a5be3f1c320a2f414ef34344091350773d20a8225d744cf1b7bf627618a00b6a2eacedf638c6800d4c')

prepare() {
  cd "drawsvg-${pkgver}"

  # changes to allow this to be built from the github tarballs again
  #sed "/^author =.*/i version = ${pkgver}" -i setup.cfg
  #sed -i "s,use_scm_version=True,use_scm_version=False,g" setup.py
  #sed '/\[tool.setuptools_scm\]/d' -i pyproject.toml

  #curl https://patch-diff.githubusercontent.com/raw/pyvisa/pyvisa/pull/545.patch | patch -p1
}

build() {
  cd "drawsvg-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "drawsvg-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

