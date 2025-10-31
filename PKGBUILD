# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.9.8
pkgrel=1
pkgdesc="Certilia Middleware for AKD smart cards (Croatian eID, Certilia)"
arch=("x86_64")
url="https://www.certilia.com"
license=("LicenseRef-AKD-Middleware-EULA")
depends=("ca-certificates-utils" "ccid" "xcb-util-cursor" "xcb-util-keysyms" "xcb-util-wm")
source=("https://repo.certilia.com/repository/debian/pool/c/${pkgname}/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
options=("!strip" "staticlibs")
install="certiliamiddleware.install"
sha512sums=("7c42e2c5a9b8ca6901c1d8612acdd8c39eff496ba629107b232f7551fd647175ee0f01332ee31d7836284e62cbabfd2426a1aec7b7e08be9624811493df08206")

package() {
  tar --no-same-owner --zstd -xvf data.tar.zst -C ${pkgdir}
  rm -rv ${pkgdir}/etc/apt
  mkdir -pv ${pkgdir}/usr/share/ca-certificates/trust-source
  mv -v ${pkgdir}/usr/share/ca-certificates/akd ${pkgdir}/usr/share/ca-certificates/trust-source/anchors
  install -vDm644 "${pkgdir}/opt/${pkgname}/licenses/MiddlewareLicense" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
