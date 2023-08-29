# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ascii-draw
pkgver=0.1.8
pkgrel=1
pkgdesc='Draw diagrams and more using ASCII'
arch=('any')
url='https://github.com/Nokse22/ascii-draw'
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-gobject' 'python-pyfiglet')
makedepends=('appstream-glib' 'cmake' 'meson' 'vala')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/Nokse22/ascii-draw/archive/v${pkgver//+/-}.tar.gz")
b2sums=('a5d7ab9edf36c8a945288d638ab3019f28a24b555770b7e5bb49ae339e59a95198ddf1fedb5ca24cbd26740e0b7980e3c408f0a258fc9caab817ce5dd2aec726')

build() {
  arch-meson "${pkgname}-${pkgver//+/-}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # permission fix
  chmod 755 "${pkgdir}/usr/bin/ascii-draw"
}
