# Maintainer: inventory69 <inventory69@users.noreply.github.com>
pkgname=simple-notes-desktop-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Cross-platform note-taking app with WebDAV sync, built with Tauri"
arch=('x86_64')
url="https://github.com/inventory69/simple-notes-desktop"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'hicolor-icon-theme'
)
optdepends=(
  'xdg-utils: for opening URLs in default browser'
)
provides=('simple-notes-desktop')
conflicts=('simple-notes-desktop' 'simple-notes-desktop-git')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Simple.Notes.Desktop_${pkgver}_amd64.deb")
sha256sums=('6ac19459f2af4d65986bcaf91a76e3e14a12ec08b271f025b24acabe17f2944f')

package() {
  # Extract data from deb package
  bsdtar -xf data.tar.gz -C "${pkgdir}/"

  # Fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  chmod 755 "${pkgdir}/usr/bin/simple-notes-desktop"

  # Install license
  install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
