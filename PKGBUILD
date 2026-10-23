# Maintainer: Will Handley <wh260@cam.ac.uk>

# NVIDIA's CuTe DSL is published only as wheels; this one carries the CUDA 13
# build of its compiler extension and runtime library, compiled for the
# current CPython. The runtime loads libcuda and the compiler runs ptxas.
pkgname=python-nvidia-cutlass-dsl-libs-cu13
_pypi=nvidia_cutlass_dsl_libs_cu13
pkgver=4.8.0
pkgrel=1
pkgdesc='NVIDIA CuTe DSL: compiler and runtime for CUDA 13'
arch=('x86_64')
url='https://pypi.org/project/nvidia-cutlass-dsl-libs-cu13/'
license=('LicenseRef-NVIDIA-Software-License-Agreement')
depends=('python>=3.14' 'python<3.15' "python-nvidia-cutlass-dsl-libs-base=${pkgver}" 'cuda' 'nvidia-utils')
makedepends=('python-installer')
options=('!strip' '!debug')
_py=cp314-cp314-manylinux_2_28_x86_64
source=("https://files.pythonhosted.org/packages/6e/ea/d1205eb6f6aa5b2c1437f0953873c81907f1a18d9409b38226c7819b0c15/${_pypi}-${pkgver}-${_py}.whl")
noextract=("${source[0]##*/}")
sha256sums=('09d17524a55f40df411616a771b7537be8ee056612681abc705424eebb30ba8e')

package() {
  python -m installer --destdir="$pkgdir" "$srcdir/${source[0]##*/}"
  install -Dm644 "$(find "$pkgdir" -path "*/${_pypi}-${pkgver}.dist-info/licenses/LICENSE")" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
