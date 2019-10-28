# Maintainer: otaj

pkgname=python-kornia-git
_name=kornia
pkgver=v0.1.3.r110.ga48164b
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=(
  'git'
  'python-setuptools'
)
depends=('python-pytorch')
provides=('python-kornia')
conflicts=('python-kornia')
options=(!emptydirs)
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
