# Maintainer: otaj

pkgname=python-kornia
_name=kornia
pkgver=0.5.0
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('python-setuptools')
depends=('python-pytorch' 'python-numpy' 'python-torchvision' 'opencv' 'ipython' 'jupyter' 'python-matplotlib')
checkdepends=('python-pytest')
options=(!emptydirs)
source=(${_name}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c6c428790becb28c9af86bf9284100ea485f6c33c735d5aa2c9754bbd5395e22')

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest -v --device all --dtype float32,float64 test/
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
