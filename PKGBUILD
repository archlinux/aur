# Maintainer: Aaron <aarongonzal@gmail.com>

pkgname=restic-box
pkgver=0.4.5
pkgrel=1
pkgdesc="A simple GTK3 tray applet for restic backups over SSH, local, or rclone remotes"
arch=('any')
url="https://github.com/Shikaku2/restic-box"
license=('BSD-3-Clause')
depends=(
  'python'
  'restic'
  'libappindicator-gtk3'
  'libnotify'
  'hicolor-icon-theme'
  'python-gobject'
  'python-cairo'
)
optdepends=(
  'fuse3: required for restic mount'
  'rclone: required for rclone backend'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Shikaku2/restic-box/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8f2a8b88d899a8cb22b1b92a5e0aa30953a3d8ff0bc4e71d7dcddeb9d5d7bad6')

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
