# Maintainer: otaj

pkgname=python-kornia
_name=kornia
pkgver=0.3.1
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('python-setuptools')
depends=('python-pytorch' 'python-numpy')
checkdepends=('python-pytest' 'python-pytest-runner')
options=(!emptydirs)
source=(${_name}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b9d45114e14f23cbe24d965f3095e0159b06d5672787959b81d6f9b4242e6c5d')

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest -v --device all --dtype all test/
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
