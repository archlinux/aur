# Maintainer: Vladyslav Aviedov <vladaviedov at protonmail dot com>
pkgname=focalboard-server-bin
pkgver=7.11.3
pkgrel=1
epoch=
pkgdesc="Focalboard is an open source, self-hosted alternative to Trello, Notion, and Asana."
arch=('x86_64')
url="https://www.focalboard.com/"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('nginx: reverse proxy server, recommended')
provides=('focalboard-server')
conflicts=('focalboard-server')
replaces=()
backup=()
options=()
install=focalboard.install
changelog=
source=("https://github.com/mattermost/focalboard/releases/download/v${pkgver}/focalboard-server-linux-amd64.tar.gz"
        'focalboard.service')
noextract=()
sha256sums=('3515ef5b90fe2d958b8869e0191915f0ca46ee4e6950e16c9647423981ebeecd'
            '607d16cb2544101d0e4291e7804c3137b90b620107a37431c0f3d71e93c4fcd5')
validpgpkeys=()

package() {
  cd "${srcdir}/focalboard"
  PACKAGE_FOLDER="$pkgdir/opt/focalboard/"
  mkdir -p "${PACKAGE_FOLDER}" "${PACKAGE_FOLDER}/bin" "${PACKAGE_FOLDER}/pack" "${PACKAGE_FOLDER}/license"

  # Copy focalboard release
  cp bin/focalboard-server "${PACKAGE_FOLDER}/bin"
  cp -r pack/* "${PACKAGE_FOLDER}/pack"
  cp config.json "${PACKAGE_FOLDER}"
  cp NOTICE.txt "${PACKAGE_FOLDER}/license"
  cp webapp-NOTICE.txt "${PACKAGE_FOLDER}/license"

  # Systemd Service
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp "${srcdir}/focalboard.service" "${pkgdir}/usr/lib/systemd/system/focalboard.service"
}
