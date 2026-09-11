# Maintainer: Mikele <mikele@gmail.com>

pkgname=appmeup
pkgver=1.2.6
pkgrel=1
pkgdesc="Create and edit Chromium web apps from .desktop files"
arch=('x86_64')
url="https://github.com/mikelexp/appmeup"
license=('GPL3')
conflicts=('appmeup-bin')
replaces=('appmeup-bin')
depends=(
  'python'
  'python-pyside6'
  'python-pyxdg'
)
optdepends=(
  'google-chrome: Google Chrome browser'
  'chromium: Chromium browser'
  'brave-bin: Brave browser'
  'vivaldi: Vivaldi browser'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c91fd88b6eee5a95a56bee44fbedadebdf68944413bd34d95b65401d1cc7185e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 appmeup.py "${pkgdir}/usr/share/${pkgname}/appmeup.py"
  cp -r src "${pkgdir}/usr/share/${pkgname}/"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/appmeup" <<'EOF'
#!/bin/sh
exec /usr/bin/python /usr/share/appmeup/appmeup.py "$@"
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
