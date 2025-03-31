# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=dosage-tracker
pkgver=1.9.6
pkgrel=1
pkgdesc="Medication tracker for Linux"
url="https://github.com/diegopvlk/Dosage"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
depends=('gjs' 'libadwaita' 'libportal')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9834bb9a182741b9b4b620943cea68c209f35f95b5d0969abb1ebb91ab6221be')

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
