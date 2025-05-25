# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ascii-draw
pkgver=1.1.0
pkgrel=1
pkgdesc='Draw diagrams and more using ASCII'
arch=('any')
url='https://github.com/Nokse22/ascii-draw'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-cairo' 'python-emoji' 'python-gobject' 'python-pyfiglet')
makedepends=('appstream-glib' 'meson')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/Nokse22/ascii-draw/archive/v${pkgver//+/-}.tar.gz")
b2sums=('56ec08347fab109890c13c9c9094137e6eabac6a38409b3c321b42029c2b0f72501b43cc7d393f8a7fc2ac4830da691102d0385ce79b6ce38f8b9708b46b77c5')

build() {
  arch-meson "${pkgname}-${pkgver//+/-}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # permission fix
  chmod 755 "${pkgdir}/usr/bin/ascii-draw"
}
