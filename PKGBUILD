# Maintainer: mdmrk <mariodavo.20@gmail.com>

pkgname=ladybird-nightly-bin
_pkgname=ladybird
pkgver=r72235.1a3635cda57
_shortcommit=1a3635cda57
pkgrel=1
pkgdesc="Nightly binary release of the Ladybird web browser"
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
  cp -a "${srcdir}/opt" "${pkgdir}/"
  cp -a "${srcdir}/usr" "${pkgdir}/"

  RELATIVE_DESKTOP_FILE_PATH='usr/share/applications/org.ladybird.Ladybird.desktop'
  sed -i -e 's#Exec=Ladybird #Exec=/opt/ladybird/usr/bin/Ladybird #' \
    "${pkgdir}/opt/ladybird/${RELATIVE_DESKTOP_FILE_PATH}"
  
  install -Dm644 "${pkgdir}/opt/ladybird/${RELATIVE_DESKTOP_FILE_PATH}" \
    "${pkgdir}/${RELATIVE_DESKTOP_FILE_PATH}"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
