# Maintainer: otaj

pkgname=python-kornia
_name=kornia
pkgver=0.4.0
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
sha256sums=('266e3fd4941897d4b35d91861110ae0412c8dc10efafdc73d7b673a0d1974f40')

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest -v --device all --dtype float32,float64 test/
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
