# Maintainer: Sander Boom <sanderboom@gmail.com>
# Improvements via PR welcome at: https://github.com/sanderboom/aur-kitematic
#
# Kitematic support for linux is still in Alpha. This package aims to be a
# quick-and-dirty solution to install and run (providing a *.desktop file) for
# the time being.
#
# Upstream URL Kitematic: https://github.com/kitematic/kitematic

pkgname=kitematic
pkgver='0.9.3'
pkgrel=1
pkgdesc="Visual Docker Container Management"
arch=('x86_64')
url="https://kitematic.com/"
license=('apache')
depends=(
  'docker'
  'desktop-file-utils'
)
makedepends=('tar')
provides=("${pkgname}")
install="${pkgname}.install"
source=(
  "https://raw.githubusercontent.com/sanderboom/kitematic/release/bin/Kitematic-linux-x64.tar.xz"
  "${pkgname}.desktop"
  "${pkgname}.svg"
)
sha256sums=('df3a4d59ae502143a717e81ccb405ec53cd3d5dea69d21ee204e9682dfe5cc37'
            '448603660a205037c83125759e523cfec9cf1a93c0b1317482740a04292d5bdc'
            '954d9803f49e475bc3242ad8b5dbfe5f3be9b532434ff260e1cf5c929f018617')

package() {
  cd "${srcdir}"

  # Application
  install -dm755 "${pkgdir}/opt"
  tar xf Kitematic-linux-x64.tar.xz -C "${pkgdir}/opt"

  # Exec
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/Kitematic (Alpha)-linux-x64/Kitematic (Alpha)" "${pkgdir}/usr/bin/${pkgname}"

  # Desktop
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
