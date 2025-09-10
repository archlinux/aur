# Maintainer: jakka <jakka@jakka.su>

pkgname=hydownloader-git
_name=hydownloader
pkgver=r696.7be4aad
pkgrel=1
pkgdesc="Alternative download system for Hydrus"
arch=(x86_64 aarch64)
url="https://gitgud.io/thatfuckingbird/hydownloader"
license=('AGPL-3.0-or-later')
depends=(
  python
  python-click
  python-bottle
  yt-dlp
  python-hydrus
  python-dateutil
  python-requests
  python-brotli
  gallery-dl
  python-pillow
  python-pysocks
)
makedepends=(
	python-poetry
	git
)
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
