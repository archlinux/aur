# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=raider-file-shredder
pkgver=1.3.1
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
b2sums=('2f66cdf97110183f2cdfed68110cb87f6fa17190257200e8acc2674e37615ff5f16316423714aaaef6da18496780c79354d75fb84d44cc23f20d2f2be458d7d1')

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
