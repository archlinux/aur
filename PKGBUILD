# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
pkgname=wpa_actiond
pkgver=1.4
pkgrel=4
pkgdesc="Daemon that connects to wpa_supplicant and handles connect and disconnect events"
arch=('x86_64' 'i686')
url="http://projects.archlinux.org/wpa_actiond.git/"
license=('GPL')
depends=('glibc' 'wpa_supplicant')
source=(https://sources.archlinux.org/other/wpa_actiond/${pkgname}-${pkgver}.tar.xz
        0001-wpa_actiond-Wait-for-three-failed-PONGs-before-disco.patch)
sha256sums=('e0e65e7c52a32796a0ff855ab18aa0b237d6b9afc87d4008c0380735abcb1a54'
            'b318ad3c2dcc65e204dfb5d21a034712fbbb801b062442869420bdf8a0060856')
validpgpkeys=('A314827C4E4250A204CE6E13284FC34C8E4B1A25')  # Thomas Bächler 

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/0001-wpa_actiond-Wait-for-three-failed-PONGs-before-disco.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  install -D -m755 wpa_actiond "${pkgdir}/usr/bin/wpa_actiond"
}
# vim:set ts=2 sw=2 et:
