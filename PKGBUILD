# Maintainer: Greyson Christoforo <grey@christoforo.net>
pkgname=python-drawsvg
pkgver=2.1.1
pkgrel=1
pkgdesc="Programmatically generate SVG (vector) images"
arch=('any')
url="https://github.com/cduck/drawSvg"
license=('MIT')
depends=('python' 'python-numpy' 'python-imageio' 'python-cairosvg')

source=("https://github.com/cduck/drawSvg/archive/${pkgver}.tar.gz")
md5sums=('1a17da2d302849fe4921576842381d38')

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
  python setup.py build
}

package(){
  cd "drawsvg-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

