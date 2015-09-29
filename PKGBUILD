# Maintainer: Peter Hoeg <first name at last name dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

pkgname=caledonia-bundle-plasma5
pkgver=2.0
pkgrel=5
pkgdesc="A bundle with all Caledonia customizations for Plasma 5"
arch=('any')
url=('http://caledonia.sourceforge.net')
license=('CCPL:by-sa')
depends=('plasma-workspace' 'caledonia-backgrounds')
_url='http://sourceforge.net/projects/caledonia/files'
source=("${_url}/Caledonia%20%28Plasma-KDE%20Theme%29/Caledonia-${pkgver}.tar.gz"
        "${_url}/Caledonia%20KSplash/Caledonia-KSplash-${pkgver}.tar.gz"
        "Caledonia-${pkgver}.colors::${_url}/Caledonia%20Color%20Scheme/Caledonia.colors")
sha256sums=('3d855b7806d23ad3f748a30e9b0fa94c8ad7ec489fd19a4c026276b3045c5bcc'
            '6b44c2a77bf2e56b2b48f535b3c3678328dcf826d2a558d319357d5fbd3c2c72'
            '455dc9cfe3071f2ade5447ef5cf25b287e75d7c0b3c51b56ed737e10a5639fb0')

package() {
  doc="${pkgdir}/usr/share/doc/caledonia-bundle"
  mkdir -p -m755 \
        "${pkgdir}/usr/share/apps/ksplash/Themes" \
        "${pkgdir}/usr/share/plasma/desktoptheme" \
        "${pkgdir}/usr/share/color-schemes" \
        "${doc}/ksplash" \
        "${doc}/plasma5" \
        "${doc}/wallpapers"

  mv Caledonia-KSplash/*.{txt,html} "$doc/ksplash"
  cp -r Caledonia-KSplash "${pkgdir}/usr/share/apps/ksplash/Themes"

  mv Caledonia/*.{txt,html} "$doc/plasma5"
  cp -r Caledonia "${pkgdir}/usr/share/plasma/desktoptheme/Caledonia"

  install -D Caledonia-${pkgver}.colors "${pkgdir}/usr/share/color-schemes/Caledonia.colors"

  find $pkgdir -type d -print0 | xargs -0 chmod 755
  find $pkgdir -type f -print0 | xargs -0 chmod 644
}
