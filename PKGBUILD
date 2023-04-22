# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-cpm-kernels
pkgver=1.0.11
pkgrel=2
pkgdesc="CPM CUDA kernels"
arch=('any')
url="https://github.com/OpenBMB/cpm_kernels"
license=('Apache')
depends=('python'
         'python-setuptools')
makedepends=('git'
             'cuda'
             'python-wheel'
             'python-installer')
optdepends=('python-pytorch')
_tag='277a0eddd6d264c6b9b9477fa47cc00880d581c0' # git rev-parse "${pkgver}"
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

build() {
  cd "${pkgname}"

  pushd cuda
  make all
  make copy
  popd

  python setup.py bdist_wheel
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
