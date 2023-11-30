# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=errands
pkgver=45.0.6
pkgrel=1
pkgdesc='Todo application for those who prefer simplicity'
url="https://github.com/mrvladus/Errands"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('python-caldav' 'python-gobject' 'libadwaita')
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
  DESTDIR="$pkgdir" meson install -C build
  chmod +x "$pkgdir/usr/bin/errands"
  install -Dm644 Errands/LICENSE -t "$pkgdir/usr/share/licenses/errands"
}
