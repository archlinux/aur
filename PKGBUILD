# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-torchsde
pkgver=0.2.6
pkgrel=1
pkgdesc="Differentiable SDE solvers with GPU support and efficient sensitivity analysis"
arch=('any')
url="https://github.com/google-research/torchsde"
license=('Apache-2.0')
depends=('python'
         'python-numpy'
         'python-scipy'
         'python-pytorch'
         'python-trampoline')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
checkdepends=('python-pytest')
_tag='5a63002b0767f629c9bc09e9965a50bf3d583ef8'
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"
  PYTHONPATH="${PWD}/build/lib" pytest tests/
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
