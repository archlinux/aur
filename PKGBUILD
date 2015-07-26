# Maintainer: Javier Tia <javier.tia[at]gmail[dot]com>
# Old Maintainer: Viliam Pucik <viliam.pucik[at]gmail[dot]com>
pkgname=hpvirtualrooms
pkgver=8.1.0.4518
pkgrel=2
pkgdesc="Online meeting client with desktop sharing support"
url="https://www.rooms.hp.com/"
arch=('x86_64' 'i686')
license=('unknown')
depends=('fontconfig' 'alsa-lib' 'glib2' 'glu' 'libpng12' 'libsm' 'libxi' 'libxrandr' 'gcc-libs')
[ "$CARCH" = "x86_64" ] && depends=('lib32-fontconfig' 'lib32-alsa-lib' 'lib32-glib2' 'lib32-glu' 'lib32-libpng12' 'lib32-libsm' 'lib32-libxi' 'lib32-libxrandr' 'lib32-gcc-libs')
makedepends=('sed')
source=("http://www.rooms.hp.com/vRoom_Cab/${pkgname}-install64-F4-${pkgver}.tar.gz" "${pkgname}")
md5sums=('8a1ba9a7517b1d2097c1649be9fee3d8'
         '5cbe25942bc5b657da9ab32bbcfa085c')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  cd "${srcdir}/${pkgname}-install"
  sed -i 's/\.hpvirtualrooms\///;/^Encoding/d' HP-hpvr.desktop
  echo "Icon=/usr/share/${pkgname}/resources/hpvricon.png" >> HP-hpvr.desktop
  mkdir -p "${pkgdir}/usr/share/${pkgname}/resources/"
  install -m755 ${pkgname}            "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  install -m644 resources/*           "${pkgdir}/usr/share/${pkgname}/resources/"
  install -Dm755 ${pkgname}-plugin.so "${pkgdir}/usr/lib/mozilla/plugins/${pkgname}-plugin.so"
  install -Dm644 HP-hpvr.desktop      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:

