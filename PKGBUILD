# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-zxing-cpp
_name=${pkgname#python-}
pkgver=3.1.0
pkgrel=1
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
  'nanobind'
  'python-build'
  'python-installer'
  'python-scikit-build-core'
  'python-wheel'
)
source=("https://github.com/zxing-cpp/zxing-cpp/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('a3eb825154f05242283e7d94d8ebdcf95beb3a534eba393cce504e91c9b215bd')

build() {
  cd "$_name-$pkgver/wrappers/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver/wrappers/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
