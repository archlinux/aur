# Maintainer: Ricardo Carlini <rcarlini at gmail dot com>
# Contributor: Emerson Almeida <emersonalmeidax at gmail dot com>
# Contributor: Tobias Borgert <tobias..borgert at gmail dot com>
# Contributor: Daniel Matos <daniel99matos at gmail dot com>
# Contributor: Marco Donadoni <marcodonadoni at live dot it>
# Contributor: Jeroen Rijken <jeroen dot rijken at gmail dot com>
pkgname=archi
_pkgver_major=5
_pkgver_minor=2
_pkgver_patch=0
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_patch}
pkgrel=0
pkgdesc="Free, open source, cross-platform tool and editor to create ArchiMate models."
arch=('x86_64')
url="http://www.archimatetool.com/"
license=('MIT')
depends=('java-runtime' 'bash')
optdepends=('webkitgtk2: hints view support')
provides=('archi')

source=("https://www.archimatetool.com/downloads/archi/${pkgver}/Archi-Linux64-${pkgver}.tgz"
  "${pkgname}.desktop"
  "${pkgname}-launcher.sh"
  "LICENSE")
sha1sums=('7696de162658d705179ee629706219cb0bd41188'
  'f6afb119731106e7391848402b01b81cb8d9e72c'
  '8ab6fb57da8e76d5a4dfa3d82a57de5172e6e4b5'
  '99c2483de8ee9bd65693caab97d5ad16455ec835')

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
