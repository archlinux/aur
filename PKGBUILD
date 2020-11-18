# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=digitalclock4-bin
pkgver=4.7.8
pkgrel=1
pkgdesc="Beautiful customizable clock with plugins"
arch=('x86_64')
url="https://sourceforge.net/projects/digitalclock4"
license=('GPL3')
depends=('qt5-speech'
         'libnotify'
         'qt5-svg'
         'gtk2'
         'qt5-x11extras')
provides=('digitalclock4')
options=('!strip')
source=("$pkgname-$pkgver.tar.xz::https://netcologne.dl.sourceforge.net/project/digitalclock4/${pkgver}/digital_clock_4-linux_x64.tar.xz")
sha256sums=('e34246c1c38f992111aa980cb879c35c6eede657497a379b4b32234211a9419d')

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
