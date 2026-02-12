# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=3
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64')
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache-2.0')
depends=(
  'python'
  'zxing-cpp'
)
makedepends=(
  'cmake'
  'pybind11'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://github.com/zxing-cpp/zxing-cpp/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('bfea8f8ebc8e04e5c4a57e5cbdc302d05c72b916d142564b6d14f01050bb93d4')

prepare() {
  cd "$_name-$pkgver"

  # We really do have the dependencies, however
  # it can't find them...
  sed -i '/cmake/d' wrappers/python/pyproject.toml
  sed -i '/pybind11/d' wrappers/python/pyproject.toml
}

build() {
  cd "$_name-$pkgver/wrappers/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver/wrappers/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
