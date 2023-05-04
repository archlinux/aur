# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-check-shapes
pkgver=1.0.0
pkgrel=3
pkgdesc="Library for annotating and checking tensor shapes."
url="https://github.com/GPflow/check_shapes"
arch=('any')
license=('Apache')
depends=('python' 'python-lark-parser')
makedepends=('python-pip' 'python-poetry')
source=("https://github.com/GPflow/check_shapes/archive/v${pkgver}.tar.gz"
        'python_version.patch')
sha256sums=('a29c6d8f6f444809bb8926a0d2943c243669c6f5dae17670c6c9428e1f2bee3a'
            '6c1a639730978ac8d018cbd9e9975d4216c57bdf50b74cb105dac87daa1c702a')

prepare() {
  cd "${srcdir}"/check_shapes-${pkgver}
  patch --forward --strip=1 --input="${srcdir}/python_version.patch"
}

build() {
  cd "${srcdir}"/check_shapes-${pkgver}
  poetry build --format wheel
}

package() {
  cd "${srcdir}"/check_shapes-${pkgver}
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
}
