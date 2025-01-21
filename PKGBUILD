# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=hydownloader
pkgver=0.50.0
pkgrel=1
_commit=0907de137ae5cdc7fd26aec0c71420de386c3d35
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
sha512sums=('3bc22a3ad62e7eb20cab96cd360f8021590a70980117932780baaf5e2a23373243a4039d781bf295abd27845c2f88ecc91e90e03e4ef29a90bcd951eae4d8b74')
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
