# Maintainer:

_module='python-ffmpeg'
_pkgname="python-$_module"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=2.0.11
pkgrel=1
pkgdesc="Python binding for FFmpeg which provides sync and async APIs"
url="https://github.com/jonghwanhyeon/python-ffmpeg"
license=('MIT')
arch=(any)

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
  'python-ffmpeg'
)
conflicts=(
  'python-ffmpeg'
  'python-ffmpeg-python'
)

options=(!emptydirs)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source+=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums+=('085604ae08ad7018109964fae38410c666d3c3391484eaa6648ac2e760e2bb18')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
