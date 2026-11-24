# Maintainer: Álvaro Castillo <sincorchetes@gmail.com>
pkgname=delta-backup
pkgver=0.3.0
pkgrel=1
pkgdesc='Time travel for your files in GNOME, with BorgBackup'
arch=(any)
url='https://delta.sincorchetes.tech'
license=(GPL-3.0-or-later)
depends=(python-gobject gtk4 libadwaita libsecret borg fuse3)
makedepends=(meson gettext appstream desktop-file-utils)
optdepends=(
  'nautilus-python: the right-click menu and the versions window from Nautilus'
  'gnome-keyring: where passwords are kept'
  'yelp: the help (F1)'
  'gst-plugins-base: the preview of a video or audio'
  'gst-plugins-good: the preview of a video or audio'
)
source=("delta-$pkgver.tar.gz::https://github.com/sincorchetes/delta/archive/v$pkgver.tar.gz")
sha256sums=('c346f1e629c00edfe049409917803a75533b9a2c2ef7dc3e16d474dfc41b7776')

build() {
  arch-meson "delta-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "delta-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "delta-$pkgver/THIRD_PARTY_LICENSES.md" "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
}
