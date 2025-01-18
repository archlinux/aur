# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=dosage-tracker
pkgver=1.8.2
pkgrel=1
pkgdesc="Medication tracker for Linux"
url="https://github.com/diegopvlk/Dosage"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
depends=('gjs' 'libadwaita' 'libportal')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2ac1623d43f9168c3b4ac8e94a3dc4a78c6b26035f2b95680347c8788febc6bc')

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
