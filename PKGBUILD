# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ascii-draw
pkgver=0.1.9
pkgrel=1
pkgdesc='Draw diagrams and more using ASCII'
arch=('any')
url='https://github.com/Nokse22/ascii-draw'
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-gobject' 'python-pyfiglet')
makedepends=('appstream-glib' 'cmake' 'meson' 'vala')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/Nokse22/ascii-draw/archive/v${pkgver//+/-}.tar.gz")
b2sums=('c9fe720047e143dba038c3699ea33118059fd75226373b2213a05a013f320fc4314c52471532da0436d5e0f6a29e0ea8cef0fcaab2c8550811124158cb2adc8f')

build() {
  arch-meson "${pkgname}-${pkgver//+/-}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # permission fix
  chmod 755 "${pkgdir}/usr/bin/ascii-draw"
}
