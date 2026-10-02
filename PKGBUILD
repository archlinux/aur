# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.9.11
pkgrel=1
pkgdesc="Certilia Middleware for AKD smart cards (Croatian eID, Certilia)"
arch=("x86_64")
url="https://www.certilia.com"
license=("LicenseRef-AKD-Middleware-EULA")
depends=("ca-certificates-utils" "ccid" "xcb-util-cursor" "xcb-util-keysyms" "xcb-util-wm")
source=("https://repo.certilia.com/repository/debian/pool/c/${pkgname}/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
options=("!strip" "staticlibs")
install="certiliamiddleware.install"
sha512sums=("afbb15f02a198e4412e616786b1c4d2f711d07b91a3d8fdc93d9b1dcf55e4aee6aba95964236d904c42e241ff4de39a5923cb5881802e5a015dad6026a5917d3")

package() {
  tar --no-same-owner --zstd -xvf data.tar.zst -C ${pkgdir}
  rm -rv ${pkgdir}/etc/apt
  mkdir -pv ${pkgdir}/usr/share/ca-certificates/trust-source
  mv -v ${pkgdir}/usr/share/ca-certificates/akd ${pkgdir}/usr/share/ca-certificates/trust-source/anchors
  install -vDm644 "${pkgdir}/opt/${pkgname}/licenses/MiddlewareLicense" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
