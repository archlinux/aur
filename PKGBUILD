# Maintainer: noureddinex
pkgname=lmstudio-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="LM Studio - A desktop app for exploring and running large language models locally"
arch=('x86_64')
url="https://lmstudio.ai"
license=('EULA')
depends=('fuse2' 'zlib' 'hicolor-icon-theme' 'gtk3' 'nss' 'libxcrypt-compat')
options=('!strip')
install=lmstudio-bin.install
source=("https://installers.lmstudio.ai/linux/x64/${pkgver}-1/LM-Studio-${pkgver}-1-x64.AppImage"
         "lmstudio.png"
         "lmstudio.desktop")
sha256sums=('d18e178cadef7d6798f19e6d41f33a297e26a1d285091cbc30da8252d18a46f0'
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
