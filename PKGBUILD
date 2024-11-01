# Maintainer: Greyson Christoforo <grey@christoforo.net>
pkgname=python-drawsvg
pkgver=2.4.0
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
sha256sums=('2ded625da44020a414493e6a7fa4e67354e6bb7968e35d89afe7af2e74939b9e')

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

