# Maintainer: viewerofall <joemomanugget@gmail.com>
pkgname=velogin
pkgver=4.0.2
pkgrel=1
pkgdesc="Graphical TTY login manager for Veil/Void systems"
arch=('x86_64')
url="https://github.com/TheHolyVeil/veilTDC"
license=('MIT')
provides=('velogin')
conflicts=('velogin')
depends=('seatd' 'libxkbcommon' 'libinput' 'mesa' 'fontconfig' 'freetype2' 'pam' 'wayland' 'systemd')
backup=('etc/pam.d/velogin')

install=velogin-bin.install

source=("velogin.tar.gz::https://github.com/viewerofall/veilTDC/releases/download/v${pkgver}/velogin.tar.gz")
sha256sums=('48356f2875ed8459c0e7526768c52712dcdebd26942c81f40a73fba88c6db08a')

package() {
  install -Dm755 "${srcdir}/velogin/velogin" "${pkgdir}/usr/bin/velogin"
  install -Dm644 "${srcdir}/velogin/dist/pam.d/velogin" "${pkgdir}/etc/pam.d/velogin"

  sed 's#/usr/local/bin/velogin#/usr/bin/velogin#' \
    "${srcdir}/velogin/dist/velogin.service" \
    >"${srcdir}/velogin.service"
  install -Dm644 "${srcdir}/velogin.service" "${pkgdir}/usr/lib/systemd/system/velogin.service"
}
