# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ffmpy
pkgname=python-$_name
pkgver=0.6.4
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
sha256sums=('07b7143fd565f52be9b9ba228d310e2575b76d04fdf13813866f3dddc4a821a8')

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

