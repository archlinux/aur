# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=hydownloader-git
_name=hydownloader
pkgver=r559.d59967b
pkgrel=1
pkgdesc="Alternative download system for Hydrus"
arch=(x86_64 aarch64)
url="https://gitgud.io/thatfuckingbird/hydownloader"
license=('GNU AGPL')
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
sha512sums=('SKIP')
optdepends=(
    'hydownloader-systray-git: Remote management GUI for hydownloader'
    'hydrus: Danbooru-like image tagging and searching system for the desktop'
)

prepare() {
  cd $srcdir/${_name}
  python -m poetry install
}

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $srcdir/${_name}
  python -m poetry build
}

package() {
  cd $srcdir/${_name}
  python -m installer --destdir $pkgdir $srcdir/${_name}/dist/${_name}-*.whl
}
