# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=dosage-tracker
pkgver=1.9.9
pkgrel=1
pkgdesc="Medication tracker for Linux"
url="https://github.com/diegopvlk/Dosage"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
depends=('gjs' 'libadwaita' 'libportal')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a66bd03b17aeb53ece41dd503628df9c292b30daa0cf55f64dc968045f31e0c')

build() {
  arch-meson Dosage-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
  ln -s io.github.diegopvlk.Dosage "$pkgdir/usr/bin/$pkgname"
}
