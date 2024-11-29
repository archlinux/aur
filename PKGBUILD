# Maintainer: envolution
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=digitalclock4-bin
_pkgname=digitalclock4
pkgver=4.7.9
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
sha256sums=('5f0033fecfa3e2c1810e8e24556c8c7d4a2c1c5efd42a325135c23603c296411')

package() {
  # Rename the directory
  mv "${srcdir}/Digital Clock 4" "${srcdir}/$_pkgname"

  # Create necessary directories
  install -d "${pkgdir}/usr/" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/pixmaps" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/$_pkgname"

  # Move the entire source directory to /usr/share
  mv -v "$srcdir/$_pkgname" "${pkgdir}/usr/share/"

  # Move specific files to their proper locations
  mv -v "${pkgdir}/usr/share/$_pkgname/digital_clock.desktop" "${pkgdir}/usr/share/applications"
  mv -v "${pkgdir}/usr/share/$_pkgname/digital_clock.svg" "${pkgdir}/usr/share/pixmaps"

  # Create a launcher script in /usr/bin
  echo "#!/usr/bin/env bash
LD_LIBRARY_PATH=/usr/share/$_pkgname/ /usr/share/$_pkgname/digital_clock.sh
" >"${pkgdir}/usr/bin/$_pkgname"
  chmod 755 "${pkgdir}/usr/bin/$_pkgname"
}
# vim:set ts=2 sw=2 et:
