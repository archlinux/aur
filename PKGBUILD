# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=llama-cpp-python-openblas
pkgver=0.3.34
pkgrel=1
pkgdesc="Python bindings for the llama.cpp library (OpenBLAS accelerated)"
arch=('x86_64')
url="https://github.com/abetlen/llama-cpp-python"
license=('MIT')
depends=('python' 'openblas' 'python-numpy' 'python-jinja')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-scikit-build-core' 'cmake' 'openblas')
provides=('llama-cpp-python')
conflicts=('llama-cpp-python')
source=("llama_cpp_python-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/l/llama-cpp-python/llama_cpp_python-$pkgver.tar.gz")
sha256sums=('d849d286d808284f1d3ec1bd6875572430d29d1f9574a010232caa4e9cef0e35')

build() {
  cd "$srcdir/llama_cpp_python-$pkgver"
  export CMAKE_ARGS="-DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/llama_cpp_python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
