# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=digitalclock4-bin
pkgver=4.7.6
pkgrel=1
pkgdesc="Beautiful customizable clock with plugins"
arch=('x86_64')
url="https://sourceforge.net/projects/digitalclock4"
license=('GPL3')
depends=('gstreamer0.10-ugly-plugins'
         'qt5-base'
         'libnotify'
         'qt5-svg'
         'gtk2'
         'qt5-multimedia'
         'qt5-x11extras')
provides=('digitalclock4')
options=('!strip')
source=("$pkgname-$pkgver.tar.xz::https://netcologne.dl.sourceforge.net/project/digitalclock4/${pkgver}/digital_clock_4-linux_x64.tar.xz")
sha256sums=('6900a3b935ab4befa23aa2931ea676c4cd533e4d5b9a9d0a0f90953a42574a91')

package() {
  install -d "${pkgdir}/opt/" \
   			 "${pkgdir}/usr/share/applications" \
   			 "${pkgdir}/usr/share/pixmaps" \
   			 "${pkgdir}/usr/bin"
  mv -v "${srcdir}/Digital Clock 4" "${pkgdir}/opt/"
  mv -v "${pkgdir}/opt/Digital Clock 4/digital_clock.desktop" "${pkgdir}/usr/share/applications"
  mv -v "${pkgdir}/opt/Digital Clock 4/digital_clock.svg" "${pkgdir}/usr/share/pixmaps"
  echo "#!/usr/bin/env bash
  LD_LIBRARY_PATH=/opt/Digital\ Clock\ 4/ /opt/Digital\ Clock\ 4/digital_clock.sh
  " > "${pkgdir}/usr/bin/digital_clock"
  chmod 755 "${pkgdir}/usr/bin/digital_clock"
}