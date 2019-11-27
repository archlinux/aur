# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=caffeinated
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple logind idle inhibitor"
arch=("x86_64")
url="https://github.com/electrickite/${pkgname}"
license=("MIT")
depends=("libbsd" "systemd")
source=(
  "https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz"
  "${pkgname}.service")
sha256sums=(
  "55cd0faf04cf35a99931ca173abc98b6ae4a8bb8cf6b3b393c55a2df67e53560"
  "29b1952dbd1c1b52e82535c1845f843dc427bad4b0831acd9f46c375d4731151")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr clean all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -m644 -D ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/user/${pkgname}.service
}
