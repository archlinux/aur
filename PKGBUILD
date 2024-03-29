# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=forgetpass
pkgver=1.0.17
_commit=3255be06cb47eaf6d838073f7b975c48e4f489cb
pkgrel=1
pkgdesc='Simple password generator for websites'
url="https://github.com/alexkdeveloper/forgetpass"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('libadwaita' 'libgee')
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
