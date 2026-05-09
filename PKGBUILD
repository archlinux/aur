# Maintainer: Omar Roth <roth@omar.yt>
pkgname=doubletake
pkgver=0.3.1
pkgrel=1
pkgdesc='AirPlay 2 mirroring sender for Linux'
arch=('x86_64')
url='https://github.com/omarroth/doubletake'
license=('GPL-3.0-only')
makedepends=('go')
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
install='doubletake.install'
source=(
  "doubletake-${pkgver}.tar.gz::https://github.com/omarroth/doubletake/archive/refs/tags/v${pkgver}.tar.gz"
  'doubletake.service'
)
sha256sums=('6145d38e163184ac73138293339bf54539b639e80b538f9d8262d3e5f43a2ad5'
            'bb51bea22f4a5a6264a509eea126fce8b7dd0de8f5127e77e6bee13a96193c84')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 bin/doubletake "${pkgdir}/usr/bin/doubletake"
  install -Dm755 bin/doubletake-ctl "${pkgdir}/usr/bin/doubletake-ctl"
  install -Dm644 man/man1/doubletake.1 "${pkgdir}/usr/share/man/man1/doubletake.1"
  install -Dm644 man/man1/doubletake-ctl.1 "${pkgdir}/usr/share/man/man1/doubletake-ctl.1"
  install -Dm644 "${srcdir}/doubletake.service" "${pkgdir}/usr/lib/systemd/user/doubletake.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
