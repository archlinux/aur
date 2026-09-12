# Maintainer: Mikele <mikele@gmail.com>
# Contributor: Mikele <mikele@gmail.com>

pkgname=appmeup-bin
pkgver=1.2.8
pkgrel=1
pkgdesc="Create and edit Chromium web apps from .desktop files"
arch=('x86_64')
url="https://github.com/mikelexp/appmeup"
license=('GPL3')
conflicts=('appmeup')
replaces=('appmeup')
depends=(
  'python'
  'pyside6'
  'python-pyxdg'
  'glibc'
  'libxcb'
  'libxkbcommon-x11'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
)
optdepends=(
  'google-chrome: Google Chrome browser'
  'chromium: Chromium browser'
  'brave-bin: Brave browser'
  'vivaldi: Vivaldi browser'
)
source=("${url}/releases/download/v${pkgver}/appmeup-${pkgver}-archlinux-x86_64.tar.gz")
sha256sums=('a81bd8a6857b985eb119db6d508c998d027db1a8e1a82ff2ef4aeaad65ead5fc')

package() {
  cd "${srcdir}"

  install -Dm755 appmeup "${pkgdir}/usr/lib/appmeup/appmeup.bin"
  install -d "${pkgdir}/usr/lib/appmeup/src"
  cp -r src/. "${pkgdir}/usr/lib/appmeup/src/"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/appmeup" <<'EOF'
#!/bin/sh
exec /usr/lib/appmeup/appmeup.bin "$@"
EOF
  install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mikelexp.appmeup.png"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/mikelexp.appmeup.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=AppMeUp!
Comment=Create and edit Chromium web apps from .desktop files
Exec=/usr/bin/appmeup
Icon=mikelexp.appmeup
Categories=Network;WebBrowser;Utility;
Terminal=false
StartupNotify=true
EOF
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
