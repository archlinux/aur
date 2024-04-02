# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ascii-draw
pkgver=0.3.2
pkgrel=1
pkgdesc='Draw diagrams and more using ASCII'
arch=('any')
url='https://github.com/Nokse22/ascii-draw'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-emoji' 'python-gobject' 'python-pyfiglet')
makedepends=('appstream-glib' 'meson')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/Nokse22/ascii-draw/archive/v${pkgver//+/-}.tar.gz")
b2sums=('4184ab4501f0af7ad4d2534e11364a40a06416bcd3b8c6d06ad811f5d6cbba482227f60a2ff75655d3102da7763e7850f3594a762da744e1aea1f607dad678ee')

build() {
  arch-meson "${pkgname}-${pkgver//+/-}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # permission fix
  chmod 755 "${pkgdir}/usr/bin/ascii-draw"
}
