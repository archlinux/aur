# Maintainer: lijiangang <lijiangang@example.com>

pkgname=clipshare-bin
pkgver=1.4.3
pkgrel=1
pkgdesc='剪贴板同步工具，支持跨平台使用，此版本在原作者基础上增加对wayland兼容性，x11没测试，如果用不了可以用作者原版，后续更新关注原作者github地址'
arch=('x86_64')
url='https://github.com/aa2013/ClipShare'
license=('GPL-3.0-only')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libnotify'
  'libx11'
  'libxrandr'
  'libxtst'
  'sqlite'
)
optdepends=(
  'gnome-shell-extension-appindicator: tray icon support on GNOME'
)
provides=('clipshare')
conflicts=('clipshare')
options=('!strip')

_archive="ClipShare-${pkgver}-linux-x86_64.tar.gz"
_dirname="ClipShare-${pkgver}-linux-x86_64"
_release_tag='v1.2.1'
_download_url='https://github.com/JianGangLi/ClipShare'

source=("${_archive}::${_download_url}/releases/download/${_release_tag}/${_archive}")
sha256sums=('2ee711555a36d90143a70ee8b78c60d742867a2f3adb8295cae1eb74f69a14e5')

package() {
  install -d "${pkgdir}/opt/clipshare"
  cp -a "${srcdir}/${_dirname}/." "${pkgdir}/opt/clipshare/"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/clipshare/clipshare "${pkgdir}/usr/bin/clipshare"

  install -Dm644 \
    "${srcdir}/${_dirname}/data/flutter_assets/assets/images/logo/logo.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/clipshare.png"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/clipshare.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=ClipShare
Comment=Cross-platform clipboard sync
Exec=clipshare
Icon=clipshare
Terminal=false
Categories=Utility;
StartupNotify=true
DESKTOP
}
