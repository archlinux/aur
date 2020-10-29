# Maintainer: otaj

pkgname=python-kornia
_name=kornia
pkgver=0.4.1
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
sha256sums=('62e785e3c7940eded4c3aeaadf493483b2e064e9c1ec93f347759e64cf25a216')

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest -v --device all --dtype float32,float64 test/
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
