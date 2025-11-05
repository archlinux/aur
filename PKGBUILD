# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski at archlinux dot org>
# Contributor: Felipe Hommen <felibank at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=geogebra-6-electron
pkgver=6.0.905.1
pkgrel=1
pkgdesc='Dynamic mathematics software with interactive graphics, algebra and spreadsheet'
arch=(any)
url='https://www.geogebra.org/'
license=(LicenseRef-GeoGebra)
depends=(electron)
makedepends=(curl)
provides=(geogebra)
conflicts=(geogebra geogebra-6-bin)
source=(https://download.geogebra.org/installers/6.0/GeoGebra-Windows-Portable-${pkgver//./-}.zip
        geogebra
        geogebra.svg
        geogebra.desktop
        geogebra-mime.xml)
sha256sums=('ba3602ee58fa392d9183490ccbbeddeb866b42e0b98f0a61d8688008ddb5859c'
            '62d6d48511ec9a3d08440d0bba7e6da35e61f84348729872941f66f2f8f15e57'
            'd81270ac2a7702246633fe11f448bd809e9250e2057077195eeabdc32b64ac46'
            'e8f3ac2c91daf1bb38ef4dddf705d341c3d8028aa4afb9b74a2d1a78a9953b98'
            '100dd83e61057b9a104630ea39a84d967475d459ab38e29783a7587b3acfb6a4')

prepare() {
  # https://gitlab.archlinux.org/pacman/pacman-contrib/-/issues/119
  curl -sSfL -o "LICENSE.html" "https://www.geogebra.org/license"
}

package() {
  cd $srcdir

  install -Dm755 geogebra "$pkgdir"/usr/bin/geogebra
  install -dm755 "$pkgdir"/usr/lib/geogebra
  cp -dpr --no-preserve=ownership resources "$pkgdir"/usr/lib/geogebra
  cp -dpr --no-preserve=ownership locales "$pkgdir"/usr/lib/geogebra

  install -Dm644 LICENSE.html -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 geogebra.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 geogebra.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/geogebra.svg
  install -Dm644 geogebra-mime.xml "$pkgdir"/usr/share/mime/packages/geogebra.xml
}
