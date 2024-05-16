# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=ascii-draw
pkgver=0.3.4
pkgrel=1
pkgdesc='Draw diagrams and more using ASCII'
arch=('any')
url='https://github.com/Nokse22/ascii-draw'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-emoji' 'python-gobject' 'python-pyfiglet')
makedepends=('appstream-glib' 'meson')
source=("${pkgname}-${pkgver//+/-}.tar.gz::https://github.com/Nokse22/ascii-draw/archive/v${pkgver//+/-}.tar.gz")
b2sums=('074621955e742da4533eb5952d68b154c6fbc6606f1c41534b3ae74caced62b56fdfd699e43f306906ac8578552109af763cd9ea074f3d749bb43b76c44845d5')

build() {
  arch-meson "${pkgname}-${pkgver//+/-}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  # permission fix
  chmod 755 "${pkgdir}/usr/bin/ascii-draw"
}
