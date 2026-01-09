# Maintainer: ABOhiccups <info@abohiccups.com>
pkgname=pixel-fx-companion-app
pkgver=1.9.24
pkgrel=1
pkgdesc="Receives Game ID from Pixel FX devices and publishes Discord activity status with artwork"
arch=('x86_64')
url="https://firmware.pixelfx.co/companion-app/"
license=('custom')
depends=(
  'gtk3'
  'nss'
  'alsa-lib'
  'libxss'
  'libxtst'
  'libnotify'
  'xdg-utils'
)
source=(
  "https://firmware.pixelfx.co/companion-app/linux/Pixel%20FX%20Companion%20App-${pkgver}-amd64.deb"
)
sha256sums=('aca986e3170abcf27a29059f02623dc0810d161fdbcc231963f684e6d27f3daa')

prepare() {
  bsdtar -xf "${srcdir}/Pixel%20FX%20Companion%20App-${pkgver}-amd64.deb"
  bsdtar -xf "${srcdir}/data.tar.xz"
}

package() {
  # Application files
  cp -r "${srcdir}/opt" "${pkgdir}/"

  # Desktop entry
  install -Dm644 \
    "${srcdir}/usr/share/applications/"*.desktop \
    "${pkgdir}/usr/share/applications/pixel-fx-companion-app.desktop"

  # Icons
  if [ -d "${srcdir}/usr/share/icons" ]; then
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share/"
  fi
}
