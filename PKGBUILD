# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=dosage-tracker
pkgver=1.6.1
_commit=6eef8ea0f9e76a280cf2b0040ae3d20e02963f19
pkgrel=1
pkgdesc='Medication tracker for Linux'
url="https://github.com/diegopvlk/Dosage"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('gjs' 'libadwaita')
makedepends=('blueprint-compiler' 'git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson Dosage build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
  ln -s io.github.diegopvlk.Dosage "$pkgdir/usr/bin/$pkgname"
}
