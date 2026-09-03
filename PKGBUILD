# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=velogin
pkgver=3.1
pkgrel=1
pkgdesc="Graphical TTY login manager for Veil/Void systems"
arch=('x86_64')
url="https://github.com/viewerofall/veilTDC"
license=('MIT')
provides=('velogin')
conflicts=('velogin')
depends=('seatd' 'libxkbcommon' 'libinput' 'mesa' 'fontconfig' 'freetype2' 'pam' 'wayland' 'systemd')
backup=('etc/pam.d/velogin')

install=velogin-bin.install

source=("velogin.tar.gz::https://github.com/viewerofall/veilTDC/releases/download/v${pkgver}/velogin.tar.gz")
sha256sums=('0f86eb75bb1401ad9922c9743433313170b0ca909bd578ba5679c15ef1c9ad41')

package() {
  install -Dm755 "${srcdir}/velogin/velogin" "${pkgdir}/usr/bin/velogin"
  install -Dm644 "${srcdir}/velogin/dist/pam.d/velogin" "${pkgdir}/etc/pam.d/velogin"

  sed 's#/usr/local/bin/velogin#/usr/bin/velogin#' \
    "${srcdir}/velogin/dist/velogin.service" \
    >"${srcdir}/velogin.service"
  install -Dm644 "${srcdir}/velogin.service" "${pkgdir}/usr/lib/systemd/system/velogin.service"
}
