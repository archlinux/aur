# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=notepad
pkgver=1.2.7
_commit=7df18c3d6245c148d628290a910459c5f62f6a5e
pkgrel=3
pkgdesc='A simple notepad for GNU/Linux distributions'
url="https://github.com/alexkdeveloper/notepad"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson notepad build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s /usr/bin/com.github.alexkdeveloper.notepad "$pkgdir/usr/bin/notepad.alexkdeveloper"
}
