# Maintainer: MAGPINY BO <magpinyb@proton.me>
pkgname=sysinfoviewer
pkgver=0.3.3
pkgrel=1
pkgdesc="A comprehensive system information viewer built with wxWidgets"
arch=('x86_64' 'aarch64')
url="https://github.com/Magpiny/sysinfoviewer"
license=('MIT')
depends=(
  'wxwidgets-gtk3>=2.8'
  'curl'
  'alsa-lib'
  'libdrm'
)
optdepends=(
  'upower: Battery vendor, model, serial and accurate time-remaining'
  'lspci: GPU name detection fallback'
  'lm_sensors: Additional hardware monitoring support'
  'smartmontools: Disk health information'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Magpiny/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-Linux.tar.gz")
sha256sums=('0188f879572d881521382e3deea94b5ad9ccbfc63845e3652034361347a7cef8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Linux"

  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  if [ -f "share/applications/${pkgname}.desktop" ]; then
    install -Dm644 "share/applications/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  fi

  if [ -f "share/icons/hicolor/256x256/apps/${pkgname}.png" ]; then
    install -Dm644 "share/icons/hicolor/256x256/apps/${pkgname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  fi
}
