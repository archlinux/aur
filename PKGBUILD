pkgname=lm-studio-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="LM Studio - A desktop app for exploring and running large language models locally"
arch=('x86_64')
url="https://lmstudio.ai"
license=('EULA')
depends=('fuse2' 'zlib' 'hicolor-icon-theme' 'gtk3' 'nss' 'libxcrypt-compat')
options=('!strip')
source=("https://installers.lmstudio.ai/linux/x64/0.4.1-1/LM-Studio-0.4.1-1-x64.AppImage"
        "lmstudio.desktop")
sha256sums=('d18e178cadef7d6798f19e6d41f33a297e26a1d285091cbc30da8252d18a46f0'
            'SKIP')

prepare() {
  chmod +x "${srcdir}/${source[0]##*/}"
}

package() {
  # Create installation directory
  install -dm755 "$pkgdir/opt/lm-studio"
  
  # Install AppImage
  install -Dm755 "${srcdir}/${source[0]##*/}" "$pkgdir/opt/lm-studio/lm-studio.AppImage"
  
  # Desktop entry
  install -Dm644 "$srcdir/lmstudio.desktop" "$pkgdir/usr/share/applications/lmstudio.desktop"
  
  # Symlink to binary
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/lm-studio/lm-studio.AppImage "$pkgdir/usr/bin/lm-studio"
}
