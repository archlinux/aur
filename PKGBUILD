# Maintainer: Grey Christoforo <first name at last name dot net>
# Co-Maintainer: Bert Peters <bert@bertptrs.nl>

pkgname=python-plotly
pkgver=5.5.0
pkgrel=1
pkgdesc="An open-source, interactive graphing library"
url="https://github.com/plotly/plotly.py"
depends=(python
python-six
python-tenacity)
# optdepends based on optional_requirements.txt
optdepends=(
'ipython'
'jupyterlab'
'python-ipywidgets'
'python-numpy'
'python-matplotlib'
'python-pillow'
'python-scipy')
makedepends=(python-setuptools
python-jupyter_core
python-tornado
jupyterlab
npm)
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/plotly/plotly.py/archive/v${pkgver}.tar.gz")
sha256sums=('6dd42afd2712c5baeca4c045e3a2b3f14decce19bed75636f7d43fae5c12851a')

build() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py build
}

package() {
  cd plotly.py-${pkgver}/packages/python/plotly
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
