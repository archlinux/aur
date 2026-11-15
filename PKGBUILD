# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='AirPlay mirroring sender for Linux (prebuilt release binary)'
arch=('x86_64')
url='https://github.com/omarroth/doubletake'
license=('LGPL-3.0-or-later')
options=('!debug')
depends=(
  'glib2'
  'glibc'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
  'libpulse'
)
optdepends=(
  'libfdk-aac: AAC-ELD audio support'
  'gst-plugin-pipewire: Wayland screen and audio capture'
  'gst-plugin-va: VA-API hardware encoding on AMD and Intel GPUs'
  'xdg-desktop-portal: Wayland capture portal integration'
)
provides=('doubletake')
conflicts=('doubletake' 'doubletake-git')
install='doubletake-bin.install'
source=(
  "doubletake-${pkgver}::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake"
  "doubletake-ctl-${pkgver}::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake-ctl"
  "doubletake-manpages-${pkgver}.tar.gz::https://github.com/omarroth/doubletake/releases/download/v${pkgver}/doubletake-manpages.tar.gz"
  "doubletake.service-${pkgver}::https://raw.githubusercontent.com/omarroth/doubletake/v${pkgver}/systemd/doubletake.service.in"
)
sha256sums=('01fb6c7b9de6f3bd693a629e248fe61ceb7af06353c8f3f21cc29878d1f9f5de'
            'e5418c1730677d3f8f6480c0c5fb4b4b68a85a408b36d9d29c30c4f010608ab4'
            '9fbdf8b91dea4b510b547602f504c78a58de2ce0f8d1fb3cc006dea5f0c119dc'
            'aa98338e191ea5ac0132bec3f37b38b2bd925155cfd15c618208ba1ccf3ff90c')

package() {
  install -Dm755 "${srcdir}/doubletake-${pkgver}" "${pkgdir}/usr/bin/doubletake"
  install -Dm755 "${srcdir}/doubletake-ctl-${pkgver}" "${pkgdir}/usr/bin/doubletake-ctl"
  install -Dm644 "${srcdir}/man1/doubletake.1" "${pkgdir}/usr/share/man/man1/doubletake.1"
  install -Dm644 "${srcdir}/man1/doubletake-ctl.1" "${pkgdir}/usr/share/man/man1/doubletake-ctl.1"
  install -Dm644 "${srcdir}/doubletake.service-${pkgver}" "${pkgdir}/usr/lib/systemd/user/doubletake.service"
  sed -i 's|@bindir@|/usr/bin|g' "${pkgdir}/usr/lib/systemd/user/doubletake.service"
}
