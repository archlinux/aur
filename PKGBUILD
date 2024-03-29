# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=dwxmlcreator
pkgver=1.0.13
_commit=8e2f4f1a4ba394e3d97ca062205b478089bc875c
pkgrel=1
pkgdesc='Dynamic wallpaper creator for GNU/Linux'
url="https://github.com/alexkdeveloper/dwxmlcreator"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s com.github.alexkdeveloper.$pkgname "$pkgdir/usr/bin/$pkgname"
}
