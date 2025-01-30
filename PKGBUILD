# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=hydownloader
pkgver=0.51.0
pkgrel=1
_commit=16b0ab3cf8fafdf341adaa8cd653f7ab2a385cf8
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
makedepends=(
	python-poetry
	git
)
provides=(hydownloader)
source=(
  "git+https://gitgud.io/thatfuckingbird/hydownloader.git#commit=$_commit"
)
sha512sums=('8e4005432582a696a41dd6789a635696a9e9706c50e4d331e8b5c6c8beeb2cf11f2c9e99232862ed67a7c14024d20f191157a573faebfe5a8624dec0c243140e')
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
