# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=hydownloader
pkgver=0.58.0
pkgrel=1
_commit=9f090a6b54747c4bd3ad51f327139477fd4f7a13
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
)
makedepends=(
	python-poetry
	git
)
provides=(hydownloader)
source=(
  "git+https://gitgud.io/thatfuckingbird/hydownloader.git#commit=$_commit"
)
sha512sums=('7b88f7e34bb8d8dcc2c4184e409ca083c0030bca919dbc876d267b9be3242adb5f9684230ec8e972ebfec64c7556ba7fcfb5bc2edf385287bfbc08703dfaca1a')
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
