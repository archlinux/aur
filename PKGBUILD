# Maintainer: envolution
# Contributor: Wu Zhenyu <wuzhenyu@ustc.edu>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=llama-cpp-python
pkgname=python-llama-cpp
pkgver=0.3.5
pkgrel=1
pkgdesc="Python bindings for llama.cpp"
# llama.so provided by llama-cpp
arch=(any)
url=https://github.com/abetlen/llama-cpp-python
depends=(
  python-typing_extensions 
  python-numpy 
  python-diskcache 
  llama.cpp
)
optdepends=(
  uvicorn # python-uvicorn
  python-fastapi
  python-pydantic-settings
  python-sse-starlette
  python-pyaml
)
makedepends=(
  python-scikit-build
  python-installer
  python-build
  python-wheel
  python-scikit-build-core
)
checkdepends=(
  python-pytest
  python-huggingface-hub
  python-scipy
  python-httpx
  python-fastapi
  python-sse-starlette
  #python-sse-starlette-context #missing but tests don't seem to require it
  python-pydantic-settings
)
license=(GPL-3.0-or-later)
_py=py3
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('f5ce47499d53d3973e28ca5bdaf2dfe820163fa3fb67e3050f98e2e9b58d2cf6')

_srcdir="llama_cpp_python-${pkgver}"
build() {
  cd $_srcdir
  python -m build --wheel --no-isolation
}
check() {
  cd $_srcdir
  python -m pytest
} 
package() {
  cd $_srcdir
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
