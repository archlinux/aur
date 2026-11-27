# Maintainer: Álvaro Castillo <sincorchetes@gmail.com>
pkgname=delta-backup
pkgver=0.5.1
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
sha256sums=('25d6696b9aa07093b2d1d1ff6167f27b5f2097a4bcb53f0ce932e3be0b7c98ea')

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
