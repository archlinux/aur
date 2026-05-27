# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='AirPlay 2 mirroring sender for Linux (prebuilt release binary)'
arch=('x86_64')
url='https://github.com/omarroth/doubletake'
license=('GPL-3.0-only')
options=('!debug')
depends=(
  'glibc'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
)
optdepends=(
  'pipewire: Wayland screen capture backend'
  'xdg-desktop-portal: Wayland capture portal integration'
)
provides=('doubletake')
conflicts=('doubletake' 'doubletake-git')
install='doubletake-bin.install'
source=(
  "doubletake::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake"
  "doubletake-ctl::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake-ctl"
  "doubletake-manpages.tar.gz::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake-manpages.tar.gz"
  'doubletake.service'
)
sha256sums=('cbb98a558cca18b2ce80f81dbb0efcb8f66392d644ba099ddc513b4dd6b54831'
            '127a58768c5aa23d5a49cc4d661d3b652e88e5529e74a6499776629c049bdac1'
            'aec700b4822d22d15fc87dc6514789f245939226734e0e2bfff64848565adb86'
            'bb51bea22f4a5a6264a509eea126fce8b7dd0de8f5127e77e6bee13a96193c84')

package() {
  install -Dm755 "${srcdir}/doubletake" "${pkgdir}/usr/bin/doubletake"
  install -Dm755 "${srcdir}/doubletake-ctl" "${pkgdir}/usr/bin/doubletake-ctl"
  install -Dm644 "${srcdir}/man1/doubletake.1" "${pkgdir}/usr/share/man/man1/doubletake.1"
  install -Dm644 "${srcdir}/man1/doubletake-ctl.1" "${pkgdir}/usr/share/man/man1/doubletake-ctl.1"
  install -Dm644 "${srcdir}/doubletake.service" "${pkgdir}/usr/lib/systemd/user/doubletake.service"
}
