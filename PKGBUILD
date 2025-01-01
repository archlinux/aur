# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=hydownloader
pkgver=0.48.0
pkgrel=1
_commit=70c52e339708279af8ad79467e00f5d3d5b981ec
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
  python-requests
  python-brotli
  gallery-dl
  python-pillow
)
makedepends=(python-poetry)
provides=(hydownloader)
source=(
  "git+https://gitgud.io/thatfuckingbird/hydownloader.git#commit=$_commit"
)
sha512sums=('cf30a0ef6bea8f5ba36f3bbcb1d4ed064aaca58875c9e9d39b1cf0844d53aa5cc1dfc1f92e1b027fa8821c45399b05bbe752f3a2828d9fee2d65215905235a09')
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
