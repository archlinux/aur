# code Maintainer:  j6k4m8
# package Maintainer:  XmoncocoX <xmoncocox@gmail.com>
pkgname=coppelia-bin
pkgver=0.0.11.alpha
_pkgver=v0.0.11-alpha
pkgrel=2
pkgdesc="A refined, cross-platform Jellyfin-focused music player"
arch=('x86_64')
url="https://github.com/j6k4m8/coppelia"
license=('Apache')
depends=('gtk3' 'mpv')
provides=("coppelia")
conflicts=("coppelia" "coppelia-git")
source=("coppelia-${pkgver}.tar.gz::https://github.com/j6k4m8/coppelia/releases/download/${_pkgver}/Coppelia-linux.tar.gz"
        "coppelia.desktop")
sha256sums=('0622c749a0d7f185296de9df9057d3eb37b06a88e5752201c49545c23b82386d'
            '4a1a33933eb046150ccdfda3f5f0b76f9af54956b945c4f0d4dc4d06fa0afea5')

package() {
  install -d "${pkgdir}/opt/coppelia"
  cp -r "${srcdir}/lib" "${pkgdir}/opt/coppelia/"
  cp -r "${srcdir}/data" "${pkgdir}/opt/coppelia/"
  install -Dm755 "${srcdir}/coppelia" "${pkgdir}/opt/coppelia/coppelia"

  # Link the executable
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/coppelia/coppelia" "${pkgdir}/usr/bin/coppelia"

  # Install desktop file
  install -Dm644 "$srcdir/coppelia.desktop" "${pkgdir}/usr/share/applications/coppelia.desktop"

  # Install icon
  install -Dm644 "${srcdir}/data/flutter_assets/assets/logo.png" "${pkgdir}/usr/share/pixmaps/coppelia.png" || true
  install -Dm644 "${srcdir}/data/flutter_assets/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/coppelia.svg" || true
}
