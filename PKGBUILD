pkgname=writers-suite-bin
pkgver=0.744
pkgrel=1
pkgdesc="Writer's Suite desktop shell + helper + WASM UI (prebuilt)"
arch=('x86_64')
url="http://softenough.com"
license=('MIT')
provides=('writers-suite')
conflicts=('writers-suite')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrandr' 'libxkbcommon' 'libdrm' 'libxcb' 'libxshmfence' 'libx11' 'libxi' 'libxcursor' 'libxinerama' 'libxext' 'libxrender' 'libsm' 'libice' 'fontconfig' 'freetype2' 'mesa' 'xdg-desktop-portal')
optdepends=('xdg-desktop-portal-gtk: GTK portal backend' 'xdg-desktop-portal-kde: KDE portal backend' 'xdg-desktop-portal-wlr: wlroots portal backend')
source=("WriterSuite-bin.tar.gz::https://softenough.com/download/aur/bin/WriterSuite-bin.tar.gz")
sha256sums=('a0312cf7009fe31a934568750596d034193f56df5fc481a4d37920336fb2b2fe')

package() {
  install -d "$pkgdir/opt/writers-suite"
  cp -a "${srcdir}/WriterSuite/." "$pkgdir/opt/writers-suite/"
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/writers-suite.desktop" <<DESKTOP
[Desktop Entry]
Name=Writer's Suite
Exec=/opt/writers-suite/WritersSuite
Icon=/opt/writers-suite/assets/icons/ws-icon-256.png
Type=Application
Categories=Office;Utility;
DESKTOP
  cat > "$pkgdir/usr/share/applications/writers-suite-mod-manager.desktop" <<DESKTOP
[Desktop Entry]
Name=WSMM
Exec=/opt/writers-suite/mod-manager/WritersSuite.ModManager
Icon=/opt/writers-suite/assets/icons/ws-icon-256.png
Type=Application
Categories=Office;Utility;
DESKTOP
  install -d "$pkgdir/usr/bin"
  ln -s /opt/writers-suite/WritersSuite "$pkgdir/usr/bin/writers-suite"
  ln -s /opt/writers-suite/mod-manager/WritersSuite.ModManager "$pkgdir/usr/bin/writers-suite-mod-manager"
  install -Dm644 "$pkgdir/opt/writers-suite/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
