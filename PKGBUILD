# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=velogin
pkgver=3.6.9
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
sha256sums=('268331e14e10f8055019181d7eb93630a59eef6a6c2db2dfe1833731f1feed47')

package() {
  install -Dm755 "${srcdir}/velogin/velogin" "${pkgdir}/usr/bin/velogin"
  install -Dm644 "${srcdir}/velogin/dist/pam.d/velogin" "${pkgdir}/etc/pam.d/velogin"

  sed 's#/usr/local/bin/velogin#/usr/bin/velogin#' \
    "${srcdir}/velogin/dist/velogin.service" \
    >"${srcdir}/velogin.service"
  install -Dm644 "${srcdir}/velogin.service" "${pkgdir}/usr/lib/systemd/system/velogin.service"
}
