# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ffmpy
pkgname=python-$_name
pkgver=1.0.0
pkgrel=1
pkgdesc='A simple Python wrapper for FFmpeg.'
arch=(any)
url='https://github.com/Ch00k/ffmpy'
license=('MIT')
depends=('python' 'ffmpeg')
makedepends=('python-uv-build' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-psutil: psutil')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a70c301edc8196812f5df88602c566c64d3da8cb494e08918b75e14a84ac8bdb')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

