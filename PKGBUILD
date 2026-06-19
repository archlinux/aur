# Maintainer: Sato Ki <satoki at em dot advant dot click>
pkgname=qfinderpro-bin
pkgver=7.13.3.0521
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
  'd4e9f0487da69d87e937a8ff0153880be589d138a08249de2319063cc3e52f22'
  '3994451507c01136c178feabd411ea7dbb44616370a174af34931a6114dc19ee'
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
