# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='tuner'
pkgver=1.3.1
pkgrel=1
pkgdesc='Discover and play internet radio stations'
arch=('x86_64')
url='https://github.com/louis77/tuner'
license=('GPL3')
depends=('geoclue' 'granite' 'gst-plugins-bad-libs')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('93f324b312eaa924c7d07f2cee29a63c7eb66692445e9281c73e7411e7e0eff0')

prepare() {
  sed -i 's/libgeocode-glib0/geocode-glib-1.0/g' "${pkgname}-${pkgver}/meson.build"
}

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
