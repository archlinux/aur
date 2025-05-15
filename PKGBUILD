# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.9.4
pkgrel=1
pkgdesc="Certilia Middleware for Certilia smart cards"
arch=("x86_64")
url="https://www.certilia.com"
license=("custom")
depends=("ca-certificates-utils" "ccid" "qt6-base" "xcb-util-cursor")
source=("${url}/update/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
options=("!strip" "staticlibs")
install="certiliamiddleware.install"
sha512sums=("fcb244cbaef8da7865e5223d5432079be8c463fe476d36675a145fffbedfa50052d1903f612f455d6d3fcda5a870667bff3c1fb482c287095f4b03a906aa086b")

package() {
  tar --no-same-owner --zstd -xvf data.tar.zst -C ${pkgdir}
  rm -rv ${pkgdir}/etc/apt
  mkdir -pv ${pkgdir}/usr/share/ca-certificates/trust-source
  mv -v ${pkgdir}/usr/share/ca-certificates/akd ${pkgdir}/usr/share/ca-certificates/trust-source/anchors
  install -vDm644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
