# Maintainer: Sato Ki <satoki at em dot advant dot click>
pkgname=qfinderpro-bin
pkgver=7.12.0.1226
pkgrel=3
pkgdesc="Quickly find and easily access all of the QNAP NAS on the same LAN."
url="https://www.qnap.com/en/utilities/essentials"
arch=('x86_64')
license=('custom')
depends=(desktop-file-utils)
source=("${pkgname}-${pkgver}.deb::https://download.qnap.com/Storage/Utility/QNAPQfinderProUbuntux64-${pkgver}.deb"
    "QNAPQfinderPro.desktop.patch"
    "QfinderPro.sh.patch"
    "QfinderUpload.sh.patch")
noextract=()
sha256sums=('d5eb72fabb872b73c6b9757be91a68dfdb7e50b2425d48279d3a62e2763cfd66'
    'bd3ceb78a908b42ca6d7a6d520216a4fb265edc59d7cde517b66095aeb50869b'
    '13d7a389a8f1915433dc353d627f961d71379c03992355973eaf8544db4ce4e8'
    '141fc1e1345f84acb88da5c0618a59a7738d95a062e50caa66c17f723a258a0c')

package() {
  cd $srcdir

  ar x "${pkgname}-${pkgver}.deb"

  tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

  qfinderprodir="${pkgdir}/usr/local/bin/QNAP/QfinderPro"
  patch "${pkgdir}/usr/share/applications/QNAPQfinderPro.desktop" < "${srcdir}/QNAPQfinderPro.desktop.patch"
  patch "${qfinderprodir}/QfinderPro.sh" < "${srcdir}/QfinderPro.sh.patch"
  patch "${qfinderprodir}/QfinderUpload.sh" < "${srcdir}/QfinderUpload.sh.patch"

  mkdir "${pkgdir}/opt"
  mkdir "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/local/bin/QNAP" "${pkgdir}/opt/"
  mv "${pkgdir}/usr/local/lib/QNAP" "${pkgdir}/usr/lib/"
  rm -r "${pkgdir}/usr/local"
  chmod 755 "${pkgdir}/usr"
  chmod 755 "${pkgdir}/usr/share"
  chmod 755 "${pkgdir}/usr/share/applications"
  chmod 755 "${pkgdir}/usr/share/pixmaps"
  chown -R root:root "${pkgdir}"
}
