# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hashsum
pkgver=4.0.9
pkgrel=1
pkgdesc="Check hashes for your files"
arch=('x86_64')
url="https://altlinux.space/alt-gnome/Hashsum"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libblake3'
  'libgcrypt'
  'libgee'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'vala'
)
checkdepends=('appstream-glib')
optdepends=('python-nautilus: Nautilus extension')
source=("git+https://altlinux.space/alt-gnome/Hashsum.git#tag=$pkgver")
sha256sums=('8d0943e3f4d8dc79a78abc0647b553cf7f2b4da973b81e88a8b78e24a35a32e4')

build() {
  arch-meson Hashsum build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
