# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=dosage-tracker
pkgver=2.1.8
pkgrel=1
pkgdesc="Medication tracker for Linux"
url="https://github.com/diegopvlk/Dosage"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
depends=('gjs' 'libadwaita' 'libportal')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ecb6ec750dc26a5e87bc9985b42ec266e9cd56d917487e0d4752ae62eb9a5fc9')

build() {
  arch-meson Dosage-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
  ln -s io.github.diegopvlk.Dosage "$pkgdir/usr/bin/$pkgname"
}
