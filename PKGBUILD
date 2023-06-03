# Maintainer:
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: getzze <getzze at gmail dot com>

pkgname='python-ffmpeg'
_pkgname='ffmpeg-python'
pkgver=0.2.0
pkgrel=5
pkgdesc="Python bindings for FFmpeg - with complex filtering support"
arch=(any)
url="https://github.com/kkroening/ffmpeg-python"
license=('Apache')
options=(!emptydirs)
depends=(
  'ffmpeg'
  'python-future'
  'python-graphviz'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pytest-runner'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-mock'
)

source=(
  "$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
)
sha256sums=(
  '01b6b7640f00585a404194a358358bdf7f4050cedcd99f41416ac8b27222c9f1'
)

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i -e 's/collections.Iterable/collections.abc.Iterable/g' ffmpeg/_run.py
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --no-isolation --wheel
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  pytest || true
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
