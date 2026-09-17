# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=acheron-nightly
pkgver=2026.09.16_61e81ca
pkgrel=1
pkgdesc="Alternative Discord client made in C++ with Qt 6"
url="https://github.com/ouwou/acheron"
arch=("x86_64")
depends=("fuse2")
provides=("acheron")
conflicts=("acheron" "acheron-git")
options=("!strip")
license=("GPL-3.0")

source=("acheron-nightly-${pkgver}.zip::https://nightly.link/ouwou/acheron/workflows/build/master/acheron-appimage.zip" "acheron.desktop::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/acheron/acheron.desktop" "acheron.png::https://raw.githubusercontent.com/Cleboost/missing-aur/main/packages/acheron/acheron.png")
sha256sums=('b0b5aa39a46a85fbc03e95d3a05db56dbbab8dfa83179d197ca7d684b6371831'
            '22348420fd0e6cce6c9cf24c1ba9f4498d27b1ed169a0e38d88a0ef6a379f8e6'
            '3109929ab2009c8ceab6d2678492e0a0cccfd058726439e7f109a79ff9f85e84')

prepare() {
  chmod +x "${srcdir}/Acheron-x86_64.AppImage"
}

package() {
  install -Dm755 "${srcdir}/Acheron-x86_64.AppImage" "${pkgdir}/opt/acheron-nightly/acheron.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/acheron-nightly/acheron.AppImage" "${pkgdir}/usr/bin/acheron"
  install -Dm644 "${srcdir}/acheron.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/acheron.png"
  install -Dm644 "${srcdir}/acheron.desktop" "${pkgdir}/usr/share/applications/acheron.desktop"
}

