# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='AirPlay mirroring sender for Linux (prebuilt release binary)'
arch=('x86_64')
url='https://github.com/omarroth/doubletake'
license=('LGPL-3.0-or-later')
options=('!debug')
depends=(
  'glibc'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
  'libpulse'
)
optdepends=(
  'gst-plugin-pipewire: Wayland screen and audio capture'
  'xdg-desktop-portal: Wayland capture portal integration'
)
provides=('doubletake')
conflicts=('doubletake' 'doubletake-git')
install='doubletake-bin.install'
source=(
  "doubletake-${pkgver}::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake"
  "doubletake-ctl-${pkgver}::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake-ctl"
  "doubletake-test-receiver-${pkgver}::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake-test-receiver"
  "doubletake-manpages-${pkgver}.tar.gz::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake-manpages.tar.gz"
  'doubletake.service'
)
sha256sums=('59027455bb844f15119232600569aded721203271001591a0afc5a0d07c06b5c'
            '1cf40195f83ef4c1f885392e1b90d2ce077270b9391a38a717598170cb1aa4eb'
            'f665f4190699c8c12ba7643749c1aaf97a34982652acf7150832680dd33d6f86'
            '688ac51b10e00aeab4a203060324e1bb8bf92892c1cfdb258fbd6b7ce01475dd'
            'bb51bea22f4a5a6264a509eea126fce8b7dd0de8f5127e77e6bee13a96193c84')

package() {
  install -Dm755 "${srcdir}/doubletake-${pkgver}" "${pkgdir}/usr/bin/doubletake"
  install -Dm755 "${srcdir}/doubletake-ctl-${pkgver}" "${pkgdir}/usr/bin/doubletake-ctl"
  install -Dm755 "${srcdir}/doubletake-test-receiver-${pkgver}" "${pkgdir}/usr/bin/doubletake-test-receiver"
  install -Dm644 "${srcdir}/man1/doubletake.1" "${pkgdir}/usr/share/man/man1/doubletake.1"
  install -Dm644 "${srcdir}/man1/doubletake-ctl.1" "${pkgdir}/usr/share/man/man1/doubletake-ctl.1"
  install -Dm644 "${srcdir}/man1/doubletake-test-receiver.1" "${pkgdir}/usr/share/man/man1/doubletake-test-receiver.1"
  install -Dm644 "${srcdir}/doubletake.service" "${pkgdir}/usr/lib/systemd/user/doubletake.service"
}
