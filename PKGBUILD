# Maintainer: Sato Ki <satoki at em dot advant dot click>
pkgname=qfinderpro-bin
pkgver=7.12.3.0521
pkgrel=2
pkgdesc="Quickly find and easily access all of the QNAP NAS on the same LAN."
url="https://www.qnap.com/en/utilities/essentials"
arch=('x86_64')
license=('custom')
depends=(desktop-file-utils)
source=("${pkgname}-${pkgver}.deb::https://download.qnap.com/Storage/Utility/QNAPQfinderProUbuntux64-${pkgver}.deb"
    "QNAPQfinderPro.desktop.patch")
noextract=()
sha256sums=('8cae3135ffc614445a58e4b8ab1e0ec58cba5ea23aa91fa00ed9cf681f74071d'
    'bd3ceb78a908b42ca6d7a6d520216a4fb265edc59d7cde517b66095aeb50869b')

package() {
  cd $srcdir

  ar x "${pkgname}-${pkgver}.deb"

  tar --no-same-owner --transform='s#usr/local/bin/QNAP#opt/QNAP#' \
      -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

  patch "${pkgdir}/usr/share/applications/QNAPQfinderPro.desktop" < "${srcdir}/QNAPQfinderPro.desktop.patch"

  install -dm755 "${pkgdir}/usr" \
                 "${pkgdir}/usr/share" \
                 "${pkgdir}/usr/share/applications" \
                 "${pkgdir}/usr/share/pixmaps"
}
