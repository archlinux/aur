# Maintainer: Dawit Worku <dawitworkujima@gmail.com>
# CI rewrites 0.2.2 and 2bf5152d4c603c9aa7793172e9472e08bc5ce5c27adb9d17af49b5f53dd58229 and attaches the result to the release,
# so the published PKGBUILD always matches the tarball it installs.
pkgname=omafil-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="File manager that follows your Omarchy theme"
arch=('x86_64')
url="https://github.com/dawitlabs/omafil"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'poppler' 'udisks2' 'xdg-utils' 'libnotify'
         'libarchive' 'glib2' 'wl-clipboard')
optdepends=('omarchy: theme and editor integration')
provides=('omafil')
# The released binary is already stripped, so makepkg would only generate a
# debug package out of nothing and strip a stripped file.
options=('!debug' '!strip')
conflicts=('omafil' 'omafil-git')
source=("omafil-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/omafil-${pkgver}-x86_64.tar.gz")
sha256sums=('2bf5152d4c603c9aa7793172e9472e08bc5ce5c27adb9d17af49b5f53dd58229')

package() {
  cd "${srcdir}"
  install -Dm755 omafil "${pkgdir}/usr/bin/omafil"
  install -Dm644 omafil.desktop "${pkgdir}/usr/share/applications/omafil.desktop"
  install -Dm644 128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/omafil.png"
  install -Dm644 32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/omafil.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/omafil/README.md"
}
