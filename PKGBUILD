# Maintainer: jakka <jakka@jakka.su>

pkgname=hydownloader
pkgver=0.65.0
pkgrel=2
_commit=9836f6d5637abae649083b006db897cb6d218213
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
provides=(hydownloader)
source=(
  "git+https://gitgud.io/thatfuckingbird/hydownloader.git#commit=$_commit"
)
sha512sums=('4fe921740d7da8daf5ab105141a6366e66ea8cec6bfdcf6f29458c7a5b8b0a2ded177ce14bbc1b2a45f0106f3713f92239a3801a657187801a36fd93686211ac')
conflicts=(hydownloader-git)
optdepends=(
  'hydownloader-systray: Remote management GUI for hydownloader'
  'hydrus: Danbooru-like image tagging and searching system for the desktop'
)

prepare() {
  cd $srcdir/${pkgname}
  python -m poetry install
}

build() {
  cd $srcdir/${pkgname}
  python -m poetry build
}

package() {
  cd $srcdir/${pkgname}
  python -m installer --destdir $pkgdir $srcdir/${pkgname}/dist/${pkgname}-${pkgver}-py3-none-any.whl
}
