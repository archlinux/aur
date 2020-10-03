# Maintainer: Greyson Christoforo <grey@christoforo.net>
pkgname=python-drawsvg
pkgver=1.6.1
pkgrel=1
pkgdesc="A Python 3 library for programmatically generating SVG images (vector drawings) and rendering them or displaying them in a Jupyter notebook"
arch=('any')
url="https://github.com/cduck/drawSvg"
license=('MIT')
depends=('python' 'python-numpy' 'python-imageio' 'python-cairosvg')

source=("https://github.com/cduck/drawSvg/archive/${pkgver}.tar.gz")
md5sums=('bd01161c1edffb34f6b955bfcb2a0108')

prepare() {
  cd "drawSvg-${pkgver}"

  # changes to allow this to be built from the github tarballs again
  #sed "/^author =.*/i version = ${pkgver}" -i setup.cfg
  #sed -i "s,use_scm_version=True,use_scm_version=False,g" setup.py
  #sed '/\[tool.setuptools_scm\]/d' -i pyproject.toml

  #curl https://patch-diff.githubusercontent.com/raw/pyvisa/pyvisa/pull/545.patch | patch -p1
}

build() {
  cd "drawSvg-${pkgver}"
  python setup.py build
}

package(){
  cd "drawSvg-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

