# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.9.6
pkgrel=1
pkgdesc="Certilia Middleware for Certilia smart cards"
arch=("x86_64")
url="https://www.certilia.com"
license=("custom")
depends=("ca-certificates-utils" "ccid" "xcb-util-cursor" "xcb-util-keysyms" "xcb-util-wm")
source=("${url}/update/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
options=("!strip" "staticlibs")
install="certiliamiddleware.install"
sha512sums=("01f1469ce414112aa5612f93c1df184caad36508007f4ea62a604808569a7dc3a98297d2f1ee9e60bfdfe30164214ab739a182d99394d214fd5ad4d2043d9806")

package() {
  tar --no-same-owner --zstd -xvf data.tar.zst -C ${pkgdir}
  rm -rv ${pkgdir}/etc/apt
  mkdir -pv ${pkgdir}/usr/share/ca-certificates/trust-source
  mv -v ${pkgdir}/usr/share/ca-certificates/akd ${pkgdir}/usr/share/ca-certificates/trust-source/anchors
  install -vDm644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
