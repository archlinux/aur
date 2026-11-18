# Maintainer: Álvaro Castillo <sincorchetes@gmail.com>
pkgname=delta-backup
pkgver=0.1.1
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
)
source=("delta-$pkgver.tar.gz::https://github.com/sincorchetes/delta/archive/v$pkgver.tar.gz")
sha256sums=('190274a4f1b5bd3c82416b9d79c8893059c4de48038e6e2c588b59466be1df59')

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
