# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=hydownloader
pkgver=0.57.0
pkgrel=1
_commit=b2b0226581de8c5288f7e8675e9c6e812d4562af
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
sha512sums=('6b110910f60036ed9385fc3b718e29c011f778a6e0b4cf50f16ffebd825b170b309e411980d6518ef6d17146263e32b6cb014e9f1a44e56d1e55cb9fe9c3b1f6')
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
