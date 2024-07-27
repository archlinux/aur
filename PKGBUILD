# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=raider-file-shredder
pkgver=3.0.1
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
b2sums=('27b873a81c9feaa84f457d8d83cdb254022f62784cf9e6523c04e6f5134ac28ddd117f06ad4d70fe49aeac1c896b5e0a77f788a3111117c078f9ded680d98d88')

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
