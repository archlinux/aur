# Maintainer: Certilia <support@certilia.com>

pkgname=certiliamiddleware
pkgver=3.9.10
pkgrel=3
pkgdesc="Certilia Middleware for AKD smart cards (Croatian eID, Certilia)"
arch=("x86_64")
url="https://www.certilia.com"
license=("LicenseRef-AKD-Middleware-EULA")
depends=("ca-certificates-utils" "ccid" "xcb-util-cursor" "xcb-util-keysyms" "xcb-util-wm")
source=("https://repo.certilia.com/repository/debian/pool/c/${pkgname}/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")
options=("!strip" "staticlibs")
install="certiliamiddleware.install"
sha512sums=("c0226bcacd18fdc47424e7517f2d1501fa2da6a67be9886c56f2bd7cfe3f26ddbc4a875ae5bb8875c07219242baee17af2806248224682434057e5d907cbee57")

package() {
  tar --no-same-owner --zstd -xvf data.tar.zst -C ${pkgdir}
  rm -rv ${pkgdir}/etc/apt
  mkdir -pv ${pkgdir}/usr/share/ca-certificates/trust-source
  mv -v ${pkgdir}/usr/share/ca-certificates/akd ${pkgdir}/usr/share/ca-certificates/trust-source/anchors
  install -vDm644 "${pkgdir}/opt/${pkgname}/licenses/MiddlewareLicense" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
