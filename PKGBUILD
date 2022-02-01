# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=batsignal
pkgver=1.3.3
pkgrel=1
pkgdesc="A lightweight battery monitor daemon"
arch=("any")
url="https://github.com/electrickite/${pkgname%-git}"
license=("ISC")
depends=("libnotify")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz"
  "${pkgname}.service")
sha256sums=(
  "d7de91f0896199185af1597405b42af9dfb26e12e029dfa37ca954b895228cbb"
  "f82fe0db1f02f4aa721d0a856680e6e3161830413088f51c1bf044b6ce5730cf")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR="${pkgdir}" install
  install -m644 -D ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/user/${pkgname}.service
}
