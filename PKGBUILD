# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ascii-draw
pkgver=0.2.0
pkgrel=1
pkgdesc='Draw diagrams and more using ASCII'
arch=('any')
url='https://github.com/Nokse22/ascii-draw'
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-gobject' 'python-pyfiglet')
makedepends=('appstream-glib' 'cmake' 'meson' 'vala')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/Nokse22/ascii-draw/archive/v${pkgver//+/-}.tar.gz")
b2sums=('1191c3496e41be0c2237fbbb5f9c5ffa06e2133637937baf5fc1dbafe104aa685db39a5d1898f47ed94a027ae31c221aee2d3e5e1368f0537e6c02c2a7c77fc9')

build() {
  arch-meson "${pkgname}-${pkgver//+/-}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # permission fix
  chmod 755 "${pkgdir}/usr/bin/ascii-draw"
}
