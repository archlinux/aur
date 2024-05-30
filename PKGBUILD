# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=colorway
_commit=b7ff8cf47032251b62e55798c6808f226bd21392
pkgver=1.2.0
pkgrel=3
pkgdesc="Generate color pairings"
url="https://github.com/lainsce/colorway"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('json-glib' 'libadwaita' 'libgee' 'libhelium')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson colorway build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/bin/io.github.lainsce.Colorway "$pkgdir/usr/bin/colorway"
}
