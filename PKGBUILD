# Maintainer: Alexander Tarasov <a.tevg@ya.ru>
pkgname=pwsp-bin
_pkgname=pipewire-soundpad
pkgver=1.12.3
pkgrel=1
pkgdesc="Lets you play audio files through your microphone (Pre-built binaries)"
arch=('x86_64' 'aarch64')
url="https://github.com/arabianq/pipewire-soundpad"
license=('MIT')
depends=('pipewire' 'alsa-lib' 'openssl')
provides=('pwsp')
conflicts=('pwsp')

source_x86_64=("pwsp-${pkgver}-x86_64.zip::https://github.com/arabianq/$_pkgname/releases/download/v$pkgver/pwsp-v$pkgver-linux-x64.zip")
source_aarch64=("pwsp-${pkgver}-aarch64.zip::https://github.com/arabianq/$_pkgname/releases/download/v$pkgver/pwsp-v$pkgver-linux-arm64.zip")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/arabianq/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  _srcsrc="${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/pwsp-cli" "${pkgdir}/usr/bin/pwsp-cli"
  install -Dm755 "${srcdir}/pwsp-daemon" "${pkgdir}/usr/bin/pwsp-daemon"
  install -Dm755 "${srcdir}/pwsp-gui" "${pkgdir}/usr/bin/pwsp-gui"

  install -Dm644 "$_srcsrc/pwsp-gui/assets/pwsp-gui.desktop" "${pkgdir}/usr/share/applications/pwsp-gui.desktop"
  install -Dm644 "$_srcsrc/pwsp-gui/assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pwsp.png"
  install -Dm644 "$_srcsrc/pwsp-gui/assets/pwsp-daemon.service" "${pkgdir}/usr/lib/systemd/user/pwsp-daemon.service"

  install -Dm644 "$_srcsrc/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
