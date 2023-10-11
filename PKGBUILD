# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=raider-file-shredder
pkgver=2.0.0
pkgrel=1
pkgdesc="Securely delete your files"
arch=('x86_64' 'aarch64')
url="https://github.com/ADBeveridge/raider"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'itstool' 'blueprint-compiler' 'python-gobject' 'gobject-introspection')
optdepends=('libnautilus-extension')
checkdepends=('appstream-glib')
conflicts=("${pkgname%-file-shredder}")
source=($url/archive/v$pkgver.tar.gz)
b2sums=('bafb2457de47c14f4f2750507c949be94155c0a432d817f71c809b2867d0c4159478868d9a869737ae9895cf852265bcfe997cc4b870cbf6c8f2645b8869828e')

build() {
  arch-meson "${pkgname%-file-shredder}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
