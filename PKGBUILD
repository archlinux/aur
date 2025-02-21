# Maintainer: Sato Ki <satoki at em dot advant dot click>
pkgname=qfinderpro-bin
pkgver=7.12.0.1226
pkgrel=1
pkgdesc="Quickly find and easily access all of the QNAP NAS on the same LAN."
arch=('x86_64')
url="https://www.qnap.com/"
depends=(desktop-file-utils)
license=('unknown')
conflicts=()
sha256sums=('d5eb72fabb872b73c6b9757be91a68dfdb7e50b2425d48279d3a62e2763cfd66')
source=("https://download.qnap.com/Storage/Utility/QNAPQfinderProUbuntux64-7.12.0.1226.deb")

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  sed -i 's/\/usr\/local\/bin/\/opt/' "${pkgdir}/usr/share/applications/QNAPQfinderPro.desktop"
  sed -i 's/\usr\/local/\/usr/' "${pkgdir}/usr/local/bin/QNAP/QfinderPro/QfinderPro.sh"
  sed -i 's/\usr\/local/\/usr/' "${pkgdir}/usr/local/bin/QNAP/QfinderPro/QfinderUpload.sh"
  mkdir "${pkgdir}/opt"
  mkdir "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/local/bin/QNAP" "${pkgdir}/opt/"
  mv "${pkgdir}/usr/local/lib/QNAP" "${pkgdir}/usr/lib/"
  rmdir "${pkgdir}/usr/local/bin" "${pkgdir}/usr/local/lib" "${pkgdir}/usr/local"
  chmod 755 "${pkgdir}/usr"
  chmod 755 "${pkgdir}/usr/share"
  chmod 755 "${pkgdir}/usr/share/applications"
  chmod 755 "${pkgdir}/usr/share/pixmaps"
}
