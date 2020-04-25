# Maintainer: otaj

pkgname=python-kornia-git
_name=kornia
pkgver=0.2.1.r1.g9797eca
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('git' 'python-setuptools')
depends=('python-pytorch' 'python-torchvision' 'opencv' 'python-matplotlib' 'ipython' 'jupyter')
checkdepends=('python-pytest')
provides=('python-kornia')
conflicts=('python-kornia')
options=(!emptydirs)
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
