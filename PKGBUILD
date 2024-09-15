# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=hydownloader-git
_name=hydownloader
pkgver=0.43.0.r3.gd59967b
pkgrel=1
pkgdesc="Alternative download system for Hydrus"
arch=(x86_64 aarch64)
url="https://gitgud.io/thatfuckingbird/hydownloader"
license=(GNU AGPL)
depends=(
  python
  python-click
  python-bottle
  yt-dlp
  python-hydrus
  python-dateutil
  python-brotli
  python-saucenao
  gallery-dl
  python-opencv
  python-numpy
  python-pillow
)
makedepends=(python-poetry)
provides=("hydownloader=${pkgver%%.r*}")
source=(
  "git+https://gitgud.io/thatfuckingbird/hydownloader.git"
)
sha256sums=('SKIP')

prepare() {
  cd $srcdir/${_name}
  python -m poetry install
}

pkgver() {
  cd "$_name"
  git describe --long --tags | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/${_name}
  python -m poetry build
}

package() {
  cd $srcdir/${_name}
  python -m installer --destdir $pkgdir $srcdir/${_name}/dist/${_name}-*.whl
}
