# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=dosage-tracker
pkgver=1.7.0
_commit=71f8e4df566b4a519684c24aeeda99df5139870b
pkgrel=2
pkgdesc='Medication tracker for Linux'
url="https://github.com/diegopvlk/Dosage"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('gjs' 'libadwaita' 'libportal')
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
