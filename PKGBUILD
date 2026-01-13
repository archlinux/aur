# Maintainer: Sato Ki <satoki at em dot advant dot click>
pkgname=qfinderpro-bin
pkgver=7.13.2.1308
pkgrel=1
pkgdesc="Quickly find and easily access all of the QNAP NAS on the same LAN."
url="https://www.qnap.com/en/utilities/essentials"
arch=('x86_64')
license=('custom')
depends=(
  'desktop-file-utils'
  'gcc-libs'
  'glib2'
  'glibc'
  'libglvnd'
  'libx11'
  'libxau'
  'libxcb'
  'libxdmcp'
  'openssl-1.1'
  'pcre2'
  'qt5-base'
  'qt5-svg'
  'zlib'
)
source=(
  "${pkgname}-${pkgver}.deb::https://download.qnap.com/Storage/Utility/QNAPQfinderProUbuntux64-${pkgver}.deb"
  "QNAPQfinderPro.desktop.patch"
)
noextract=()
sha256sums=(
  '948234653b427d133fb46ad23d8447bb44647853321946e80db2a5b72a93c8b4'
  'bd3ceb78a908b42ca6d7a6d520216a4fb265edc59d7cde517b66095aeb50869b'
)

package() {
  cd $srcdir

  ar x "${pkgname}-${pkgver}.deb"

  tar --no-same-owner --transform='s#usr/local/bin/QNAP#opt/QNAP#' \
      -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

  patch "${pkgdir}/usr/share/applications/QNAPQfinderPro.desktop" < "${srcdir}/QNAPQfinderPro.desktop.patch"

  install -dm755 "${pkgdir}/usr" \
                 "${pkgdir}/usr/local" \
                 "${pkgdir}/usr/local/bin" \
                 "${pkgdir}/usr/local/lib" \
                 "${pkgdir}/usr/share" \
                 "${pkgdir}/usr/share/applications" \
                 "${pkgdir}/usr/share/pixmaps"
}
