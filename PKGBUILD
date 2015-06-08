# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=systems-nominal
pkgver=1.0
pkgrel=2
pkgdesc="An experimental game by Nerd^3"
arch=('i686' 'x86_64')
url="http://www.nerdcubed.co.uk/games/"
license=('custom: commercial')
depends=('libgl' 'gconf' 'cairo' 'fontconfig' 'gtk2' 'nss' 'libxtst' 'gcc-libs' 'alsa-lib' 'libudev.so.0')
md5sums=('688f9172036bb86ee372bd7fbfd254f5'
         'ab6dfe6c1ce9f311aace15c5a6855c75'
         'db0da9f5e3708f8f5fd7a14678c07fd5')
PKGEXT=.pkg.tar
source=(http://assets.nerdcubed.co.uk/systems_nominal_${pkgver}_linux.7z
        ${pkgname}.desktop
        ${pkgname}.png)
        
_game_path=systems_nominal_${pkgver}_linux
        
if test "$CARCH" == i686; then
  __arch=linux32
elif test "$CARCH" == x86_64; then
  __arch=linux64
fi

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"
  install -d "${pkgdir}/usr/share/${pkgname}"

  cp -r ${__arch}/* "${pkgdir}"/usr/share/${pkgname}
  install -m644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -m644 "${srcdir}"/${pkgname}.png "${pkgdir}"/usr/share/icons/
  
  ln -s /usr/share/${pkgname}/systemsnominal "${pkgdir}"/usr/bin/${pkgname}
}
