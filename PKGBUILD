# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=errands
pkgver=45.1.8
pkgrel=1
pkgdesc='Todo application for those who prefer simplicity'
url="https://github.com/mrvladus/Errands"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('python-caldav' 'python-gobject' 'python-icalendar' 'libadwaita' 'libsecret')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson Errands build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  chmod +x "$pkgdir/usr/bin/errands"
  install -Dm644 Errands/LICENSE -t "$pkgdir/usr/share/licenses/errands"
}
