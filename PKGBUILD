# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ascii-draw
pkgver=0.4.0
pkgrel=1
pkgdesc='Draw diagrams and more using ASCII'
arch=('any')
url='https://github.com/Nokse22/ascii-draw'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-emoji' 'python-gobject' 'python-pyfiglet')
makedepends=('appstream-glib' 'meson')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/Nokse22/ascii-draw/archive/v${pkgver//+/-}.tar.gz")
b2sums=('a23581334a6b5f3d2ce45bb1cb020fa9793bfaa3c60e359d75ff92616beed32a484cf5e87b1c54dfc8d06f803216ff16a7814970b8d95c9a016cd4d37dccfc5c')

build() {
  arch-meson "${pkgname}-${pkgver//+/-}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # permission fix
  chmod 755 "${pkgdir}/usr/bin/ascii-draw"
}
