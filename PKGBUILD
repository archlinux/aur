# Maintainer: noureddinex
pkgname=lmstudio-bin
pkgver=0.4.3
pkgrel=2
_pkgver=${pkgver}-${pkgrel}
pkgdesc="LM Studio - A desktop app for exploring and running large language models locally"
arch=('x86_64')
url="https://lmstudio.ai"
license=('EULA')
depends=('fuse2' 'zlib' 'hicolor-icon-theme' 'gtk3' 'nss' 'libxcrypt-compat')
options=('!strip')
install=lmstudio-bin.install
source=("https://installers.lmstudio.ai/linux/x64/${_pkgver}/LM-Studio-${_pkgver}-x64.AppImage"
         "lmstudio.png"
         "lmstudio.desktop")
sha256sums=('91441c6bae87220e727ed7d0943edc56a8c94d0de044dad7a29b95ea76bf9a47'
            '9f791789c959a11316328692807737a5f1bc1c170ae99ec04c56bfd8ee8263e5'
            'd5ac11aae025cd1cc0f9aa0713ee427dc6f46e4d1adac2a5948f93d8bbca705f')

prepare() {
  chmod +x "${srcdir}/${source[0]##*/}"
}

package() {
  # Create installation directory
  install -dm755 "$pkgdir/opt/lm-studio"
  
  # Install AppImage
  install -Dm755 "${srcdir}/${source[0]##*/}" "$pkgdir/opt/lm-studio/lm-studio.AppImage"
  
  # Install static icon
  install -Dm644 "${srcdir}/lmstudio.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/lmstudio-bin.png"
  install -Dm644 "${srcdir}/lmstudio.png" "${pkgdir}/usr/share/pixmaps/lmstudio-bin.png"
  
  # Desktop entry
  install -Dm644 "$srcdir/lmstudio.desktop" "$pkgdir/usr/share/applications/lmstudio.desktop"
  
  # Symlink to binary
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/lm-studio/lm-studio.AppImage "$pkgdir/usr/bin/lm-studio"
}
