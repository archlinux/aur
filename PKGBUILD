pkgname=systemd-pilot
_app_id=io.github.mfat.systemdpilot
pkgver=3.0
pkgrel=3
pkgdesc="Desktop application for managing systemd services"
arch=('any')
url="https://github.com/mfat/systemd-pilot"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'gtksourceview4'
  'python-gobject'
  'python-keyring'
  'python-paramiko'
  'python-rich'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc36692ead79abb18577d7c5a64da5f2985a66e9fedd6e7f0a10cfcf1a4728ea')

prepare() {
  export PAGER=cat
  cd "$pkgname-$pkgver"
  desktop-file-edit --set-key=StartupWMClass --set-value="$pkgname" \
    "data/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 src/main.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 systemd-pilot.png "$pkgdir/usr/share/pixmaps/${_app_id}.png"
  install -Dm644 "data/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
}
