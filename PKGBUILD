# Maintainer: Sander Boom <sanderboom@gmail.com>
# Improvements via PR welcome at: https://github.com/sanderboom/aur-kitematic
#
# Kitematic support for linux is not yet official. This package aims to be a
# quick-and-dirty solution to install and run (providing a *.desktop file) for
# the time being.
#
# Upstream URL Kitematic: https://github.com/kitematic/kitematic
# Upstream URL linux-support: https://github.com/zedtux/kitematic

pkgname=kitematic
pkgver='0.8.2'
pkgrel=1
pkgdesc="Visual Docker Container Management"
arch=('x86_64')
url="https://kitematic.com/"
license=('apache')
groups=()
depends=(
  'docker'
  'desktop-file-utils'
)
makedepends=('tar')
provides=("${pkgname}")
backup=()
options=()
install="${pkgname}.install"
source=(
  "https://raw.githubusercontent.com/sanderboom/kitematic/bin/bin/Kitematic-linux-x64.tar.xz"
  "${pkgname}.desktop"
  "${pkgname}.svg"
)
noextract=()
sha256sums=(
  '2ce59e61bf0b9e56a2c84b95af2a1844ec31dab0c2385291eaf27d79e853d4ac'
  '448603660a205037c83125759e523cfec9cf1a93c0b1317482740a04292d5bdc'
  '954d9803f49e475bc3242ad8b5dbfe5f3be9b532434ff260e1cf5c929f018617'
)

package() {
  cd "${srcdir}"

  # Application
  install -dm755 "${pkgdir}/opt"
  tar xf Kitematic-linux-x64.tar.xz -C "${pkgdir}/opt"

  # Exec
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/Kitematic-linux-x64/Kitematic" "${pkgdir}/usr/bin/${pkgname}"

  # Desktop
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
