# Maintainer: Sean Anderson <seanga2@gmail.com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=find_libpython
pkgname=python-$_name
pkgver=0.5.1
pkgrel=1
pkgdesc="Finds the libpython associated with your environment, wherever it may be hiding."
arch=('any')
url="https://github.com/ktbarrett/find_libpython"
license=('MIT')
depends=('python')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-pytest')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('47935e2d0a7442d5097f74a20483297f2d5d2faf76160354b6416034494d2858')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check(){
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
