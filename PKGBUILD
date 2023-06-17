# Maintainer:

_module='python-ffmpeg'
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=2.0.4
pkgrel=1
pkgdesc="Python binding for FFmpeg which provides sync and async APIs"
arch=(any)
url="https://github.com/jonghwanhyeon/python-ffmpeg"
license=('MIT')
options=(!emptydirs)
depends=(
  'ffmpeg'
  'python'
  'python-pyee'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pytest-runner'
  'python-setuptools'
  'python-wheel'
)

provides=(
  "$pkgname"
  'python-ffmpeg'
)
conflicts=(
  "${provides[@]}"
  'python-ffmpeg-python'
)

source=(
  "$_module-$pkgver.tar.gz"::"https://github.com/jonghwanhyeon/python-ffmpeg/archive/v$pkgver.tar.gz"
)
sha256sums=(
  'a7977cc3d8658f94a33cd15c5710e008c9e5442df32f57e7df8cbb4ad38a97f3'
)

build() {
  cd "$srcdir/$_module-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_module-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
