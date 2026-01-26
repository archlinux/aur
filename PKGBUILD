# Maintainer: ahm4dd
pkgname=manverse-bin
pkgver=__VERSION__
pkgrel=1
pkgdesc="Local-first manga/manhwa reader with AniList sync"
arch=('x86_64')
url="https://github.com/ahm4dd/ManVerse"
license=('Apache')
depends=('fuse2')
provides=('manverse')
conflicts=('manverse')
options=('!strip')
source=(
  "ManVerse-${pkgver}.AppImage::https://github.com/ahm4dd/ManVerse/releases/download/v${pkgver}/ManVerse-${pkgver}.AppImage"
  "manverse.desktop"
  "manverse.png"
  "LICENSE"
)
sha256sums=('__APPIMAGE_SHA256__' 'cd1cd151452fa5ebb0b26b3c751d5df605781db1de672a82f3e7cfbed3e1b2b9' '2f580ad89e1af08a185d3169d28627244868ca1c8fb8535840f381f4e4c48f87' '2b60e20c042419ada741e53048c452c1341398f45e29787ceb7035a5ea120a5a')

package() {
  install -Dm755 "${srcdir}/ManVerse-${pkgver}.AppImage" "${pkgdir}/opt/manverse/ManVerse.AppImage"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/manverse" <<'SCRIPT'
#!/usr/bin/env sh
exec /opt/manverse/ManVerse.AppImage "$@"
SCRIPT
  install -Dm644 "${srcdir}/manverse.desktop" "${pkgdir}/usr/share/applications/manverse.desktop"
  install -Dm644 "${srcdir}/manverse.png" "${pkgdir}/usr/share/pixmaps/manverse.png"
}
