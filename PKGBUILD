# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp
_name=${pkgname#python-}
pkgver=3.1.1
pkgrel=2
pkgdesc="Python bindings for zxing-cpp"
arch=('x86_64' 'aarch64')
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache-2.0')
depends=(
  'python'
  'zxing-cpp'
)
makedepends=(
  'cmake'
  'nanobind'
  'python-build'
  'python-installer'
  'python-scikit-build-core'
  'python-wheel'
)
source=("https://github.com/zxing-cpp/zxing-cpp/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('c3c02c29c0b519de7bd4e25b376e606e87f0761befd1282815642a2246613d14')

build() {
  cd "$_name-$pkgver/wrappers/python"
  export SKBUILD_CMAKE_BUILD_TYPE=RelWithDebInfo
  export SKBUILD_INSTALL_STRIP=false
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver/wrappers/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
