# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=caffeinated
pkgver=0.2.2
pkgrel=1
pkgdesc="Simple logind and Wayland idle inhibitor"
arch=("any")
url="https://github.com/electrickite/${pkgname}"
license=("MIT")
depends=("libbsd" "systemd" "wayland" "wayland-protocols")
source=(
  "https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz"
  "${pkgname}.service")
sha256sums=(
  "e6277c70a72652a3f12e5b169446733ca30d6fc9ac25275eb2375f88d1824f3f"
  "29b1952dbd1c1b52e82535c1845f843dc427bad4b0831acd9f46c375d4731151")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr WAYLAND=1 clean all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" WAYLAND=1 install
  install -m644 -D ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/user/${pkgname}.service
}
