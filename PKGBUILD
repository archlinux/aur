# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=errands
pkgver=46.2.2
_commit=f1b0e6028a1ffb12cfe941b09793f26800b7a22d
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
