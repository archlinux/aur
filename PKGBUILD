# Maintainer: Sam Bilbow <samuel.bilbow@icloud.com>
pkgname=ultraleap-hand-tracking-control-panel
pkgver=3.3.1
pkgrel=1
epoch=
pkgdesc="A visualisation and settings management tool for the Ultraleap Tracking Service."
arch=('x86_64')
url="https://gitlab.com/northstar-archlinux/ultraleap-hand-tracking-control-panel.git"
license=('PROPRIETARY')
groups=('ultraleap-hand-tracking')
depends=(ultraleap-hand-tracking-service)
makedepends=()
checkdepends=()
optdepends=()
provides=('ultraleap-hand-tracking-control-panel')
conflicts=()
replaces=()
backup=()
options=()
install='ultraleap-hand-tracking-control-panel.install'
changelog=
source=("https://repo.ultraleap.com/apt/pool/main/u/${pkgname}/${pkgname}_1062807.deb")
noextract=()
md5sums=('c2868d8de43abbd1687ec63989a121d6')
validpgpkeys=()

prepare() {
    tar xJf "data.tar.xz"

    # Fix wrong version (it should be the desktop entry format version)
    sed -i "s/VERSIONINFOHERE/1.0/g" "${srcdir}/usr/share/applications/ultraleap-hand-tracking-control-panel.desktop"

    # Make the icon visible in Xfce's settings panel
    sed -i 's/Categories=Settings/Categories=Settings;X-XFCE-SettingsDialog;/g' "${srcdir}/usr/share/applications/ultraleap-hand-tracking-control-panel.desktop"
}

package() {
  # Install files in opt directory
  install -Dm755 "${srcdir}/opt/ultraleap-hand-tracking-control-panel/ultraleap-hand-tracking-control-panel" \
    "${pkgdir}/opt/ultraleap-hand-tracking-control-panel/ultraleap-hand-tracking-control-panel"
  install -Dm755 "${srcdir}/opt/ultraleap-hand-tracking-control-panel/UnityPlayer.so" \
    "${pkgdir}/opt/ultraleap-hand-tracking-control-panel/UnityPlayer.so"
  cp -r "${srcdir}/opt/ultraleap-hand-tracking-control-panel/ultraleap-hand-tracking-control-panel_Data/" "${pkgdir}/opt/ultraleap-hand-tracking-control-panel/"


  # Install files in usr directory
  install -Dm755 "${srcdir}/usr/bin/ultraleap-hand-tracking-control-panel" \
    "${pkgdir}/usr/bin/ultraleap-hand-tracking-control-panel"
  install -Dm644 "${srcdir}/usr/share/applications/ultraleap-hand-tracking-control-panel.desktop" \
    "${pkgdir}/usr/share/applications/ultraleap-hand-tracking-control-panel.desktop"
  install -Dm644 "${srcdir}/usr/share/doc/ultraleap-hand-tracking-control-panel/copyright" \
    "${pkgdir}/usr/share/doc/ultraleap-hand-tracking-control-panel/copyright"
  install -Dm644 "${srcdir}/usr/share/doc/ultraleap-hand-tracking-control-panel/changelog.gz" \
    "${pkgdir}/usr/share/doc/ultraleap-hand-tracking-control-panel/changelog.gz"
  install -Dm644 "${srcdir}/usr/share/lintian/overrides/ultraleap-hand-tracking-control-panel" \
    "${pkgdir}/usr/share/lintian/overrides/ultraleap-hand-tracking-control-panel"
  cp -r  "${srcdir}/usr/share/gnome-shell/" \
    "${pkgdir}/usr/share/gnome-shell/"

  # Install icons
  for size in 8x8 16x16 22x22 24x24 32x32 36x36 42x42 48x48 64x64 72x72 96x96 128x128 192x192 256x256
  do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}/apps/ultraleap_hand_tracking_control_panel.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/ultraleap_hand_tracking_control_panel.png"
  done
}
