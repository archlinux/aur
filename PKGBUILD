# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.9.12
pkgrel=1
pkgdesc="Certilia Middleware for AKD smart cards (Croatian eID, Certilia)"
arch=("x86_64")
url="https://www.certilia.com"
license=("LicenseRef-AKD-Middleware-EULA")
depends=("ca-certificates-utils" "ccid" "xcb-util-cursor" "xcb-util-keysyms" "xcb-util-wm")
source=("https://repo.certilia.com/repository/debian/pool/c/${pkgname}/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
options=("!strip" "staticlibs")
install="certiliamiddleware.install"
sha512sums=("5428f9654be9447e022dd102d4fe0a63cf5029e3502e6235e6f964d17757016b7c90a877b07ce524e0f736f411efc5289a73c10dab467aec0a42dd2df790e3e3")

package() {
  tar --no-same-owner --zstd -xvf data.tar.zst -C ${pkgdir}
  rm -rv ${pkgdir}/etc/apt
  mkdir -pv ${pkgdir}/usr/share/ca-certificates/trust-source
  mv -v ${pkgdir}/usr/share/ca-certificates/akd ${pkgdir}/usr/share/ca-certificates/trust-source/anchors
  install -vDm644 "${pkgdir}/opt/${pkgname}/licenses/MiddlewareLicense" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
