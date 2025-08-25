# Maintainer: RuDesktop <info@rudesktop.ru>
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

pkgname=rudesktop
pkgver=2.8.1153
pkgrel=1
arch=('x86_64')
pkgdesc="Ru-Desktop client for home use"
url="https://rudesktop.ru/downloads/"
license=('custom')
install=${pkgname}.install
depends=(python-six glib2 python-xlib libxinerama python gdk-pixbuf2 libxcb gcc-libs hicolor-icon-theme glibc cairo libpulse python-evdev pango libxkbcommon libxtst util-linux-libs libxfixes gtk3 python-pynput)
sha256sums=('ed9e4ea76dccc28fadec9522cf54b7ad583ca62005ba0342b7b3ff16a58c63db')
options=(!debug)
source=("https://storage.rudesktop.ru/download/rudesktop-2.8.1153-amd64.deb")

prepare() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz
}

package() {
  cd "${srcdir}"
  install -m 755 -d "${pkgdir}"/usr/share/rudesktop-client
  cp -r usr/share/rudesktop-client "${pkgdir}"/usr/share/
  cp -r usr/share/applications "${pkgdir}"/usr/share/
  cp -r usr/share/icons "${pkgdir}"/usr/share/
  install -Dm765 usr/bin/rudesktop "${pkgdir}/usr/bin/rudesktop"
  install -Dm664 usr/lib/libsciter-gtk.so "${pkgdir}/usr/lib/libsciter-gtk.so"
  install -Dm644 usr/share/${pkgname}-client/files/systemd/${pkgname}.service      "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
  install -Dm644 usr/share/${pkgname}-client/files/systemd/${pkgname}.service.user "${pkgdir}"/usr/lib/systemd/user/${pkgname}.service
}
