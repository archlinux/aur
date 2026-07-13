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
source=("llama-cpp-python-$pkgver.tar.gz::https://github.com/abetlen/llama-cpp-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d1ab8c0a3ae23c41552135606a3bf2056b28c0fd45d2322bdc11b1f9a7df9f94')

build() {
  cd "$srcdir/llama-cpp-python-$pkgver"
  export CMAKE_ARGS="-DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/llama-cpp-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
