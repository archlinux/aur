pkgname=kocr-gui-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='KOCR desktop app (prebuilt binary)'
arch=('x86_64')
url='https://github.com/KercyDing/kocr'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'gtk3' 'libayatana-appindicator' 'libxkbcommon' 'wayland' 'mesa' 'libx11' 'libxrandr' 'libxi' 'libxcursor' 'libxinerama' 'spectacle' 'wl-clipboard' 'libnotify')
provides=('kocr-gui')
conflicts=('kocr-qt-bin' 'kocr-gtk-bin')
source=("kocr-gui-0.4.0-linux-amd64.deb::https://github.com/KercyDing/kocr/releases/download/v0.4.0/kocr-gui-0.4.0-linux-amd64.deb")
sha256sums=('f5a89560292daeb7c18f8b2d6288a8d3e2a1e4ac90949b956c071f7cb22dee2c')

package() {
  cd "${srcdir}"
  bsdtar -xf "kocr-gui-0.4.0-linux-amd64.deb"
  local data_tar
  data_tar=$(find . -maxdepth 1 -type f -name 'data.tar.*' | head -n 1)
  bsdtar -xf "${data_tar}"

  install -Dm644 "usr/share/doc/kocr-gui/LICENSE" "${pkgdir}/usr/share/licenses/kocr-gui-bin/LICENSE"
  install -Dm644 "usr/share/doc/kocr-gui/NOTICE" "${pkgdir}/usr/share/licenses/kocr-gui-bin/NOTICE"
  install -Dm644 "usr/share/doc/kocr-gui/LICENSE-PaddleOCR" "${pkgdir}/usr/share/licenses/kocr-gui-bin/LICENSE-PaddleOCR"
  install -Dm644 "usr/share/doc/kocr-gui/LICENSE-SourceHanSans" "${pkgdir}/usr/share/licenses/kocr-gui-bin/LICENSE-SourceHanSans"
  install -Dm755 usr/bin/kocr-gui "${pkgdir}/usr/bin/kocr-gui"
  install -Dm644 usr/share/applications/kocr-gui.desktop "${pkgdir}/usr/share/applications/kocr-gui.desktop"
  install -Dm644 usr/share/pixmaps/kocr.png "${pkgdir}/usr/share/pixmaps/kocr.png"
}
