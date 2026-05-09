# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake-bin
pkgver=0.3.1
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
sha256sums=('07fdac544e19dd683027b0bee8092edbb2182969afd6bfea8c7e52c63c57805c'
            '203cdcfa9718ee1d454f7fd0070d642d69a9d5ca3fe141f0152c2fb2d920521b'
            'fe0bb48e49a87fccb70d2dd7dfafd07ae81f7283721c0ecbac3cd592a710b990'
            'bb51bea22f4a5a6264a509eea126fce8b7dd0de8f5127e77e6bee13a96193c84')

package() {
  install -Dm755 "${srcdir}/doubletake" "${pkgdir}/usr/bin/doubletake"
  install -Dm755 "${srcdir}/doubletake-ctl" "${pkgdir}/usr/bin/doubletake-ctl"
  install -Dm644 "${srcdir}/man1/doubletake.1" "${pkgdir}/usr/share/man/man1/doubletake.1"
  install -Dm644 "${srcdir}/man1/doubletake-ctl.1" "${pkgdir}/usr/share/man/man1/doubletake-ctl.1"
  install -Dm644 "${srcdir}/doubletake.service" "${pkgdir}/usr/lib/systemd/user/doubletake.service"
}
