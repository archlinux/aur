# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=raider-file-shredder
pkgver=1.3.0
pkgrel=1
pkgdesc="Securely delete your files"
arch=('x86_64' 'aarch64')
url="https://github.com/ADBeveridge/raider"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'itstool' 'blueprint-compiler' 'gobject-introspection' 'gi-docgen')
optdepends=('libnautilus-extension')
checkdepends=('appstream-glib')
conflicts=("${pkgname%-file-shredder}")
source=($url/archive/v$pkgver.tar.gz)
b2sums=('a97ba293a026fc4f4abbd6733257f0fa89afd636f35ce9277cb355b070d0b176faaa97327b2b026b7978032bfa31c339d54ff0b9f1315df9d42e8fe103b3778b')

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
