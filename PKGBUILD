# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake-bin
pkgver=0.4.0
pkgrel=3
pkgdesc='AirPlay 2 mirroring sender for Linux (prebuilt release binary)'
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
  "doubletake-manpages-${pkgver}.tar.gz::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake-manpages.tar.gz"
  'doubletake.service'
)
sha256sums=('1a19517cef2ab5c9712cdfd5995a103bdcb0f3b415cf8cccd9c1d90ffd302840'
            '6eab8a1e7bf41c95b22b0b1097341a095d73e1992c98d16b1a96dfaf5080e5fa'
            '81354b15ba9ff41357b63f0ef8c73f061c551e5ee8db47064ff1a60768ef3f60'
            'bb51bea22f4a5a6264a509eea126fce8b7dd0de8f5127e77e6bee13a96193c84')

package() {
  install -Dm755 "${srcdir}/doubletake-${pkgver}" "${pkgdir}/usr/bin/doubletake"
  install -Dm755 "${srcdir}/doubletake-ctl-${pkgver}" "${pkgdir}/usr/bin/doubletake-ctl"
  install -Dm644 "${srcdir}/man1/doubletake.1" "${pkgdir}/usr/share/man/man1/doubletake.1"
  install -Dm644 "${srcdir}/man1/doubletake-ctl.1" "${pkgdir}/usr/share/man/man1/doubletake-ctl.1"
  install -Dm644 "${srcdir}/doubletake.service" "${pkgdir}/usr/lib/systemd/user/doubletake.service"
}
