# Maintainer: Aaron <aarongonzal@gmail.com>

pkgname=restic-box
pkgver=0.3.7
pkgrel=1
pkgdesc="A simple GTK3 tray applet for restic backups over SSH or local/mounted directory"
arch=('any')
url="https://github.com/Shikaku2/restic-box"
license=('BSD-3-Clause')
depends=(
  'python'
  'restic'
  'libappindicator-gtk3'
  'hicolor-icon-theme'
  'python-gobject'
  'python-cairo'
)
optdepends=(
  'fuse3: required for restic mount'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Shikaku2/restic-box/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a285f032ae4158c5d0a60e027dfbfe9670f3161c7b5b153941a360e2b0044668')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 restic-box.desktop \
    "$pkgdir/usr/share/applications/restic-box.desktop"

  install -Dm644 icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/restic-box.svg"

  install -Dm644 LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
