# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>

pkgname=('python-pytorch-rocm-bin')
pkgdesc="Tensors and Dynamic neural networks in Python with strong GPU acceleration (binary release)"
pkgver=2.3.0
pkgrel=2
url="https://pytorch.org"
license=('BSD')
arch=('x86_64')
depends=('google-glog' 'gflags' 'opencv' 'openmp' 'openmpi' 'pybind11' 'python' 'python-yaml' 'libuv'
         'python-numpy' 'python-sympy' 'protobuf' 'ffmpeg' 'python-future' 'qt6-base' 'eigen'
         'intel-oneapi-mkl' 'python-typing_extensions' 'numactl' 'python-jinja'
         'python-networkx' 'python-filelock')
makedepends=('python-setuptools' 'python-wheel')
conflicts=(python-pytorch)
provides=("python-pytorch=${pkgver}" "python-pytorch-rocm=${pkgver}")
source=("https://download.pytorch.org/whl/rocm6.0/torch-${pkgver}%2Brocm6.0-cp312-cp312-linux_x86_64.whl")
sha256sums=('992c1ffb65c773a5848e4bbe22235c0386a7915690615ad68a45609228c13269')


package() {
    # Define where to install the package
    cd "${srcdir}"

    # Install the wheel file
    python -m pip install --no-deps --root="${pkgdir}" torch-${pkgver}%2Brocm6.0-cp312-cp312-linux_x86_64.whl --break-system-packages --no-warn-script-location --ignore-installed
    ln -sf /usr/lib/libgomp.so ${pkgdir}/usr/lib/python3.12/site-packages/torch/lib/libgomp.so
}
