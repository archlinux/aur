# Maintainer: baboon

pkgname="xenia-canary-bin"
pkgver=9132035
pkgrel=2
pkgdesc="Xenia Canary is an experimental fork of the Xenia emulator. "
arch=('x86_64')
url="https://github.com/xenia-canary"
license=('BSD-3-Clause')
depends=(
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libx11'
  'libxcb'
  'sdl2'
  'zlib'
  )
conflicts=()
provides=('xenia-canary')
source=("https://github.com/xenia-canary/xenia-canary-releases/releases/download/${pkgver}/xenia_canary_linux.tar.gz"
        "https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/1024.png"
        "https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/512.png"
        "https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/256.png"
        "https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/128.png"
        "https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/64.png"
        "https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/48.png"
        "https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/32.png"
        "https://raw.githubusercontent.com/xenia-canary/xenia-canary/refs/heads/canary_experimental/assets/icon/16.png")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
options=('!strip')

package() {
  cd $pkgdir
  mkdir -p usr/bin
  cd usr/bin
  tar xvf $srcdir/xenia_canary_linux.tar.gz
  rm LICENSE
  cd $pkgdir
  mkdir -p usr/share/icons/hicolor/16x16/apps
  mkdir -p usr/share/icons/hicolor/32x32/apps
  mkdir -p usr/share/icons/hicolor/48x48/apps
  mkdir -p usr/share/icons/hicolor/64x64/apps
  mkdir -p usr/share/icons/hicolor/128x128/apps
  mkdir -p usr/share/icons/hicolor/256x256/apps
  mkdir -p usr/share/icons/hicolor/512x512/apps
  mkdir -p usr/share/icons/hicolor/1024x1024/apps
  cp $srcdir/16.png usr/share/icons/hicolor/16x16/apps/xenia-canary.png
  cp $srcdir/32.png usr/share/icons/hicolor/32x32/apps/xenia-canary.png
  cp $srcdir/48.png usr/share/icons/hicolor/48x48/apps/xenia-canary.png
  cp $srcdir/64.png usr/share/icons/hicolor/64x64/apps/xenia-canary.png
  cp $srcdir/128.png usr/share/icons/hicolor/128x128/apps/xenia-canary.png
  cp $srcdir/256.png usr/share/icons/hicolor/256x256/apps/xenia-canary.png
  cp $srcdir/512.png usr/share/icons/hicolor/512x512/apps/xenia-canary.png
  cp $srcdir/1024.png usr/share/icons/hicolor/1024x1024/apps/xenia-canary.png
  mkdir -p usr/share/applications
  echo "#!/bin/bash
  # wrapper that calls /usr/bin/xenia_canary in ~/.xenia-canary
  mkdir -p \$HOME/.xenia-canary
  cd \$HOME/.xenia-canary
  cp -vn /usr/bin/xenia_canary \$HOME/.xenia-canary
  exec \$HOME/.xenia-canary/xenia_canary" > usr/bin/xenia-canary
  chmod a+x usr/bin/xenia-canary
  echo "[Desktop Entry]
Name=Xenia Canary
Comment=Xenia Canary is an experimental fork of the Xenia emulator. 
Exec=/usr/bin/xenia-canary
Type=Application
Categories=Emulator;Game;
Keywords=xbox
Terminal=false
Icon=xenia-canary
Comment=An experimental emulator for the Xbox 360.
" > usr/share/applications/xenia-canary-bin.desktop
}
