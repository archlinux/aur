# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.9.14
pkgrel=1
pkgdesc="Certilia Middleware for AKD smart cards (Croatian eID, Certilia)"
arch=("x86_64")
url="https://www.certilia.com"
license=("LicenseRef-AKD-Middleware-EULA")
depends=("ca-certificates-utils" "ccid" "xcb-util-cursor" "xcb-util-keysyms" "xcb-util-wm")
source=("https://repo.certilia.com/repository/debian/pool/c/${pkgname}/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
options=("!strip" "staticlibs")
install="certiliamiddleware.install"
sha512sums=("cbf2cf32a19126b7efdbfc838453d12bcdd337a6f8fd1eaab7c1285088ab2a4a1dc4fb14d3a7b8c9771b580c35484fb4e504a398231431953724db796088e9b1")

package() {
  tar --no-same-owner --zstd -xvf data.tar.zst -C ${pkgdir}
  rm -rv ${pkgdir}/etc/apt
  mkdir -pv ${pkgdir}/usr/share/ca-certificates/trust-source
  mv -v ${pkgdir}/usr/share/ca-certificates/akd ${pkgdir}/usr/share/ca-certificates/trust-source/anchors
  install -vDm644 "${pkgdir}/opt/${pkgname}/licenses/MiddlewareLicense" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
