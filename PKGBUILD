# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp
_name=${pkgname#python-}
pkgver=3.2.0
pkgrel=1
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
sha256sums=('eacc2495f452be751d9dd453f4d6cccd0e9a40131e002bcf54d2580ce5c19ad8')

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
