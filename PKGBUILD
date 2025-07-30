# Maintainer: Gon Solo <gonsolo@gmail.com>
pkgname=python-ctypeslib
pkgver=2.4.0
pkgrel=1
pkgdesc="A Python library for generating ctypes bindings from C code"
arch=('x86_64')
url="https://github.com/trolldbois/ctypeslib"
license=('MIT')
depends=('clang')
makedepends=('git' 'python' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("git+https://github.com/trolldbois/ctypeslib.git#tag=v${pkgver}" "arch.patch")
sha256sums=('2e0ede1275db5b3bf933ab955692deb61b1cec05b59545571043be5f2e8af890'
            'f668507dc1017264ee7ac433c50e3e40e401590373f34f1d9627f3a3f4b73d14')

prepare() {
  cd "${srcdir}/ctypeslib"
  patch -Np1 -i "${srcdir}/arch.patch"
}

build() {
  cd "${srcdir}/ctypeslib"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/ctypeslib"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
