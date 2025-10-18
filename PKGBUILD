# Maintainer: mdmrk <mariodavo.20@gmail.com>

pkgname=ladybird-nightly-bin
_pkgname=ladybird
pkgver=r72241.7fb65283c23
_shortcommit=7fb65283c23
pkgrel=1
pkgdesc="Nightly release of the Ladybird web browser"
arch=('x86_64')
url="https://github.com/LadybirdBrowser/ladybird"
license=('BSD-2-Clause')
options=('!strip')
provides=('ladybird')
conflicts=('ladybird' 'ladybird-git')
depends=(
  curl
  libgl
  simdutf-git
  qt6-base
  qt6-multimedia
  qt6-tools
  qt6-wayland
  ttf-liberation
)
source=(
  "ladybird-nightly-${pkgver}.tar.zst::https://github.com/mdmrk/ladybird-nightly-bin/releases/download/vr72235.1a3635cda57/ladybird-nightly-r72235.1a3635cda57.tar.zst"
)
sha256sums=(
  'SKIP'
)

package() {
  install -d "${pkgdir}/opt"
  cp -a "${srcdir}/opt/ladybird" "${pkgdir}/opt/"

  install -d "${pkgdir}/usr"
  mv "${pkgdir}/opt/ladybird/usr/share" "${pkgdir}/usr/"

  sed -i 's#^Exec=.*#Exec=/opt/ladybird/usr/bin/Ladybird %U#' \
    "${pkgdir}/usr/share/applications/org.ladybird.Ladybird.desktop"

  sed -i 's#^Exec=.*#Exec=/opt/ladybird/usr/bin/Ladybird %U#' \
    "${pkgdir}/usr/share/applications/org.ladybird.Ladybird.desktop"

  sed -i 's#^Icon=.*#Icon=org.ladybird.Ladybird#' \
    "${pkgdir}/usr/share/applications/org.ladybird.Ladybird.desktop"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/ladybird/usr/bin/Ladybird "${pkgdir}/usr/bin/ladybird"

  install -Dm644 "${srcdir}/opt/ladybird/usr/share/licenses/ladybird-nightly-build/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  rm -rf "${pkgdir}/usr/share/licenses/ladybird-nightly-build"
}
