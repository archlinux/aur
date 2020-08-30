# Maintainer: otaj

pkgname=python-kornia-git
_name=kornia
pkgver=0.4.0.r15.g6434c36
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('git' 'python-setuptools')
depends=('python-pytorch' 'python-numpy' 'python-torchvision' 'opencv' 'ipython' 'jupyter' 'python-matplotlib')
checkdepends=('python-pytest')
provides=('python-kornia')
conflicts=('python-kornia')
options=(!emptydirs)
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "${srcdir}/${_name}"
  pytest -v --device all --dtype float32,float64 test/
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
