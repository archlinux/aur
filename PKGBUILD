# Maintainer: Emerson Almeida <emersonalmeidax at gmail dot com>
# Contributor: Tobias Borgert <tobias..borgert at gmail dot com>
# Contributor: Daniel Matos <daniel99matos at gmail dot com>
# Contributor: Marco Donadoni <marcodonadoni at live dot it>
# Contributor: Jeroen Rijken <jeroen dot rijken at gmail dot com>
pkgname=archi
_pkgver_major=5
_pkgver_minor=0
_pkgver_patch=2
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_patch}
pkgrel=5
pkgdesc="Free, open source, cross-platform tool and editor to create ArchiMate models."
arch=('x86_64')
url="http://www.archimatetool.com/"
license=('MIT')
depends=('java-runtime-openjdk=8' 'bash')
optdepends=('webkitgtk2: hints view support')
provides=('archi')

source=("https://www.archimatetool.com/downloads/archi.php?/${pkgver}/Archi-Linux64-${pkgver}.tgz"
  "${pkgname}.desktop"
  "${pkgname}-launcher.sh"
  "LICENSE")
md5sums=('74a3102ff593f7e6374808eeb3a65f57'
  '7b9a0cf8e67790ff9ca1afc6578e3adc'
  'da5e0498fe923984150c6dbb08ae9bd8'
  '66653b079752362c3e9fc7142027cb7e')

package() {
  cd "${srcdir}"

  # Docs
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 Archi/docs/* "${pkgdir}/usr/share/doc/${pkgname}/"

  # Icon and desktop file
  install -Dm644 Archi/icon.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Launcher
  install -Dm755 "${pkgname}-launcher.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Copy binaries
  rm -R Archi/docs
  rm Archi/icon.xpm Archi/Archi.sh
  install -d "${pkgdir}/opt"
  cp -R Archi/ "${pkgdir}/opt/${pkgname}"
  chmod 755 "${pkgdir}/opt/${pkgname}/Archi"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
