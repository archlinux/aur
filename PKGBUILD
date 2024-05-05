# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=errands
pkgver=46.0.3
_commit=7b8b57715282e7d281fba9332d9b39a72f3e3aab
pkgrel=1
pkgdesc='Todo application for those who prefer simplicity'
url="https://github.com/mrvladus/Errands"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('gtksourceview5' 'python-caldav' 'python-gobject' 'python-icalendar'
         'python-pycryptodomex' 'libadwaita' 'libsecret')
optdepends=('gnome-online-accounts')
makedepends=('git' 'meson')
checkdepends=('appstream')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson Errands build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  chmod +x "$pkgdir/usr/bin/errands"
  install -Dm644 Errands/LICENSE -t "$pkgdir/usr/share/licenses/errands"
}
