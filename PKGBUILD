# Maintainer:

_module='python-ffmpeg'
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=2.0.12
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
  'python-setuptools'
  'python-wheel'
)
_checkdepends=(
  'python-pytest-runner'
)

conflicts=(
  'python-ffmpeg-python'
)

options=(!emptydirs)

_pkgsrc="$_module-$pkgver"
_pkgext="tar.gz"
source+=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums+=('ca72a9fb0af3fc175827a068a7c52813507140a63dc86df2b504ac5c1683bf18')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
