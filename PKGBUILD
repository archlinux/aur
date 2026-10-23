# Maintainer: Will Handley <wh260@cam.ac.uk>

# NVIDIA's CuTe DSL is published only as wheels; this one carries the MLIR
# dialect bindings and the iket profiler, compiled for the current CPython.
pkgname=python-nvidia-cutlass-dsl-libs-base
_pypi=nvidia_cutlass_dsl_libs_base
pkgver=4.8.0
pkgrel=1
pkgdesc='NVIDIA CuTe DSL: MLIR bindings and profiler'
arch=('x86_64')
url='https://pypi.org/project/nvidia-cutlass-dsl-libs-base/'
license=('LicenseRef-NVIDIA-Software-License-Agreement')
depends=('python>=3.14' 'python<3.15' "python-nvidia-cutlass-dsl-libs-core=${pkgver}")
makedepends=('python-installer')
options=('!strip' '!debug')
_py=cp314-cp314-manylinux_2_28_x86_64
source=("https://files.pythonhosted.org/packages/d1/d2/22980e2fded6fb7232b027fe1afb1a93a4b999cba293deeaf188f007e48e/${_pypi}-${pkgver}-${_py}.whl")
noextract=("${source[0]##*/}")
sha256sums=('728abf1bc065fa950ad4f4506928300d7e32f3148312b93f83f3f2e8f756329a')

package() {
  python -m installer --destdir="$pkgdir" "$srcdir/${source[0]##*/}"
  install -Dm644 "$(find "$pkgdir" -path "*/${_pypi}-${pkgver}.dist-info/licenses/LICENSE")" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
