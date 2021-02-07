# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=micro-cap
pkgver=12
pkgrel=1
epoch=0
pkgdesc='an integrated schematic editor and mixed analog/digital circuit simulator'
arch=(x86_64)
url='http://www.spectrum-soft.com/index.shtm'
license=('custom')
depends=(
wine
wine-gecko
wine-mono
winetricks
xorg-server-xvfb
)

# archived at https://web.archive.org/web/20201107223859/http://www.spectrum-soft.com/download/mc12cd.zip
source=("${pkgname}-${pkgver}.zip::http://www.spectrum-soft.com/download/mc${pkgver}cd.zip" launcher.sh setup.iss.tar LICENSE)
sha256sums=('f4fda36ae96ab618c0487b2ff199b37bb8b12a26ecabc2ef11c6d36a5bac02a7'
            '826f2d2d409889d8ed20e8770de3f07d9d20c7a5f9a39950066295cee613828a'
            '92823edceadc722b5c9c8951de18e6ee7166fcb5d8ae625212f456aa8f1d1fb8'
            '350a5c1fe63617959e971db8f3f97a694b251fefee296c88fcbd939d3ec90f63')

noextract=(${pkgname}-${pkgver}.zip)

#build(){
#  install -m755 -d tmp tmp/env tmp/local
#  export WINEPREFIX="${srcdir}/"tmp/env
#  export XDG_DATA_HOME="${srcdir}"/tmp/local
#  wineboot -u
#
#  cp setup.iss tmp/env/drive_c 
#  WINEDEBUG=-all wine "$srcdir"/setup.exe /SMS /s /f1"C:\setup.iss"
#}

package() {
  cp launcher.sh micro-cap
  install -m755 -Dt "${pkgdir}"/usr/bin micro-cap

  install -m755 -Dt "${pkgdir}"/usr/share/micro-cap ${pkgname}-${pkgver}.zip
  install -m644 -Dt "${pkgdir}"/usr/share/micro-cap setup.iss

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
