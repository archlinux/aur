# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=batsignal
pkgver=1.3.1
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
  "86aa22d4cd852e3358112cac18b804b7068b620ab80fa5a940d32e6c81fd8fa5"
  "f82fe0db1f02f4aa721d0a856680e6e3161830413088f51c1bf044b6ce5730cf")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -m644 -D ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/user/${pkgname}.service
}
