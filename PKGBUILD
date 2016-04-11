# Maintainer: Jakob Nixdorf <flocke@shadowice.org>
# Contributor: CanalGuada <dguadal at free dot fr> (original PKGBUILD for vertex-themes)
# Author: horst3180 @ deviantart

pkgname=arc-themes
pkgver=20160331
pkgrel=1
pkgdesc='A flat theme with transparent elements'
_gnomever=3.20
arch=('any')
url='https://github.com/horst3180/arc-theme'
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engine-murrine')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/horst3180/arc-theme/archive/${pkgver}.tar.gz")
sha256sums=('13042e424ce66475de03c774e0026e3038b8b3e2ea787bc850451d8c05922253')

build() {
  cd "${srcdir}/arc-theme-${pkgver}"
  ./autogen.sh --prefix=/usr --with-gnome=${_gnomever}
}
package() {
  cd "${srcdir}/arc-theme-${pkgver}"

  make DESTDIR="${pkgdir}" install

  cd extra
  for name in "Chrome" "Arc-Plank"; do
    find "${name}" -type f -not -name *~ -exec install -Dm644 '{}' "${pkgdir}/usr/share/themes/{}" \;
  done

  cd ..
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README.md "${pkgdir}/usr/share/themes/Arc/README"
}

# vim: ts=2 sw=2 et:
