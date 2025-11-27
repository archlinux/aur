# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ascii-draw
pkgver=1.2.0
pkgrel=1
pkgdesc='Draw diagrams and more using ASCII'
arch=('any')
url='https://github.com/Nokse22/ascii-draw'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-cairo' 'python-emoji' 'python-gobject' 'python-pyfiglet')
makedepends=('appstream-glib' 'meson')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/Nokse22/ascii-draw/archive/v${pkgver//+/-}.tar.gz")
b2sums=('51052fcdfab869396be126d384c688fd564e85af6a371eb3fa27f4c03399409d3c821358131fd7f74b7f194b3388f6e79bbe2ddeec2034e0e963a3b498007ebd')

build() {
  arch-meson "${pkgname}-${pkgver//+/-}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # permission fix
  chmod 755 "${pkgdir}/usr/bin/ascii-draw"
}
