# Maintainer: Álvaro Castillo <sincorchetes@gmail.com>
pkgname=delta-backup
pkgver=0.1.0
pkgrel=1
pkgdesc='Time travel for your files in GNOME, with BorgBackup'
arch=(any)
url='https://delta.sincorchetes.tech'
license=(GPL-3.0-or-later)
depends=(python-gobject gtk4 libadwaita libsecret borg fuse3)
makedepends=(meson gettext appstream desktop-file-utils)
optdepends=(
  'python-nautilus: the right-click menu and the versions window from Nautilus'
  'gnome-keyring: where passwords are kept'
  'yelp: the help (F1)'
)
source=("delta-$pkgver.tar.gz::https://github.com/sincorchetes/delta/archive/v$pkgver.tar.gz")
sha256sums=('886d3a2252dd1f28031853f705653d05ca2fa29758783e0271999f90b61ca1a7')

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
