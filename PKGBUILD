# Maintainer: otaj

pkgname=python-kornia-git
_name=kornia
pkgver=v0.3.1.r10.gf4f70fe
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('git' 'python-setuptools')
depends=('python-pytorch' 'python-numpy')
checkdepends=('python-pytest' 'python-pytest-runner')
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
  cd "${srcdir}/${_name}"
  pytest -v --device all --dtype float32,float64 test/
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
