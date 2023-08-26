# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ascii-draw
pkgver=0.1.5
pkgrel=1
pkgdesc='Draw diagrams and more using ASCII'
arch=('any')
url='https://github.com/Nokse22/ascii-draw'
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-gobject' 'python-pyfiglet')
makedepends=('appstream-glib' 'cmake' 'meson' 'vala')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/Nokse22/ascii-draw/archive/v${pkgver//+/-}.tar.gz")
b2sums=('b69fb0f9a93c363c6e1d1610a48bcc1d1bc846ad3f37f9d17efee696ae051537d77ce627265dd942eec2306df71af1f52f0116ec16d840f714a495c1cd0eb7f3')

build() {
  arch-meson "${pkgname}-${pkgver//+/-}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # permission fix
  chmod 755 "${pkgdir}/usr/bin/ascii-draw"
}
