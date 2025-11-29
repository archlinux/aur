# Maintainer: Toxa Anderson <andToxa at gmail dot com>
# Contributor: Ricardo Carlini <rcarlini at gmail dot com>
# Contributor: Emerson Almeida <emersonalmeidax at gmail dot com>
# Contributor: Tobias Borgert <tobias..borgert at gmail dot com>
# Contributor: Daniel Matos <daniel99matos at gmail dot com>
# Contributor: Marco Donadoni <marcodonadoni at live dot it>
# Contributor: Jeroen Rijken <jeroen dot rijken at gmail dot com>

pkgname=archi
_pkgver_major=5
_pkgver_minor=7
_pkgver_patch=0
pkgver=${_pkgver_major}.${_pkgver_minor}.${_pkgver_patch}
pkgrel=2
pkgdesc="Free, open source, cross-platform tool and editor to create ArchiMate models."
arch=('x86_64')
url="http://www.archimatetool.com/"
license=('MIT')
depends=('java-runtime' 'bash' 'curl')
optdepends=('webkitgtk2: hints view support')
provides=('archi')

# The first source is just a placeholder to avoid makepkg error.
# The real archive is downloaded manually in prepare() with fallback support.
source=("https://github.com/archimatetool/archi.io/releases/download/5700/Archi-Linux64-${pkgver}.tgz"
        "${pkgname}.desktop"
        "LICENSE")
sha1sums=('d4757c33e019e8da3522aa89807634644a309c25'
          '9db2f9482f32c316c97a14a3345cb417f57945c2'
          '99c2483de8ee9bd65693caab97d5ad16455ec835')

package() {
  cd "${srcdir}"

  # Install documentation files
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 Archi/docs/* "${pkgdir}/usr/share/doc/${pkgname}/"

  # Install icon and desktop entry
  install -Dm644 Archi/icon.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Remove unneeded files and install main application directory
  rm -R Archi/docs
  rm Archi/icon.xpm Archi/Archi.sh
  install -d "${pkgdir}/opt"
  cp -R Archi/ "${pkgdir}/opt/${pkgname}"
  chmod 755 "${pkgdir}/opt/${pkgname}/Archi"

  # Install license file
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
