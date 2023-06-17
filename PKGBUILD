# Maintainer:

_module='python-ffmpeg'
_pkgname="python-$_module"
pkgname="$_pkgname-git"
pkgver=2.0.4.r4.g9870752
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
  'git'
  'python-build'
  'python-installer'
  'python-pytest-runner'
  'python-setuptools'
  'python-wheel'
)

provides=(
  "$_pkgname"
  'python-ffmpeg'
)
conflicts=(
  ${provides[@]}
  'python-ffmpeg-python'
)

source=(
  "$_module"::"git+https://github.com/jonghwanhyeon/python-ffmpeg"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_module"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_module"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_module"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
