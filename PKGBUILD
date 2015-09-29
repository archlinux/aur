# Maintainer: Peter Hoeg <first name at last name dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

pkgname='caledonia-plasma-theme'
pkgver=2.0
pkgrel=2
pkgdesc="Caledonia theme: for KDE plasma"
arch=('any')
url=('http://caledonia.sourceforge.net')
license=('CCPL:by-sa')
depends=('plasma-workspace')
conflicts=('caledonia-bundle-plasma5' 'plasma-theme-caledonia')
replaces=()
_url='http://sourceforge.net/projects/caledonia/files'
source=("${_url}/Caledonia%20%28Plasma-KDE%20Theme%29/Caledonia-${pkgver}.tar.gz"
        "${_url}/Caledonia%20KSplash/Caledonia-KSplash-${pkgver}.tar.gz"
        "Caledonia-${pkgver}.colors::${_url}/Caledonia%20Color%20Scheme/Caledonia.colors")
sha256sums=('3d855b7806d23ad3f748a30e9b0fa94c8ad7ec489fd19a4c026276b3045c5bcc'
            '6b44c2a77bf2e56b2b48f535b3c3678328dcf826d2a558d319357d5fbd3c2c72'
            '455dc9cfe3071f2ade5447ef5cf25b287e75d7c0b3c51b56ed737e10a5639fb0')

package() {
  _doc="${pkgdir}/usr/share/doc/${pkgname}"

  mkdir -p -m755 \
        "${pkgdir}/usr/share/ksplash/Themes" \
        "${pkgdir}/usr/share/plasma/desktoptheme" \
        "${pkgdir}/usr/share/color-schemes" \
        "${pkgdir}/usr/share/apps/ksplash/Themes" \
        "${pkgdir}/usr/share/apps/plasma/desktoptheme" \
        "${pkgdir}/usr/share/apps/color-schemes" \
        "${_doc}/ksplash" \
        "${_doc}/plasma"

  mv Caledonia-KSplash/*.{txt,html} "$_doc/ksplash"
  cp --recursive Caledonia-KSplash "${pkgdir}/usr/share/ksplash/Themes"
  ln --relative --symbolic "$pkgdir/usr/share/ksplash/Themes/Caledonia-KSplash" "$pkgdir/usr/share/apps/ksplash/Themes/Caledonia-KSplash"

  mv Caledonia/*.{txt,html} "$_doc/plasma"
  cp --recursive Caledonia "${pkgdir}/usr/share/plasma/desktoptheme/Caledonia"
  ln --relative --symbolic "$pkgdir/usr/share/plasma/desktoptheme/Caledonia" "$pkgdir/usr/share/apps/plasma/desktoptheme/Caledonia"

  install -D Caledonia-${pkgver}.colors "${pkgdir}/usr/share/color-schemes/Caledonia.colors"
  ln --relative --symbolic "$pkgdir/usr/share/color-schemes/Caledonia.colors" "$pkgdir/usr/share/apps/color-schemes/Caledonia.colors"

  find "$pkgdir" -type d -print0 | xargs -0 chmod 755
  find "$pkgdir" -type f -print0 | xargs -0 chmod 644
}
