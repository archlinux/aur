# Maintainer: daguo <dgxz99@users.noreply.github.com>

pkgname=pinshot-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Lightweight Wayland screenshot, screen-pinning, scrolling capture and GIF tool for GNOME Shell (prebuilt binary)'
arch=('x86_64')
url='https://github.com/dgxz99/pinshot'
license=('MIT')
depends=(
  'gnome-shell'
  'wl-clipboard'
  'pango'
  'xdg-desktop-portal-gnome'
  'pipewire'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugin-pipewire'
  'hicolor-icon-theme'
)
optdepends=(
  'satty: annotate screenshots and pins'
  'libnotify: desktop notifications'
)
provides=('pinshot')
conflicts=('pinshot' 'pinshot-git')
install="${pkgname}.install"
source_x86_64=("${url}/releases/download/v${pkgver}/pinshot-v${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('b62fec347f130c1bb56a8376662b0975f96f97d5da52a7e3609ce4341be06470')

package() {
  cd "pinshot-v${pkgver}-linux-${CARCH}"
  install -Dm755 bin/pinshot "${pkgdir}/usr/bin/pinshot"

  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -r share/gnome-shell/extensions/pinshot@dgxz99 \
    "${pkgdir}/usr/share/gnome-shell/extensions/pinshot@dgxz99"

  if [[ -d share/pinshot/ocr ]]; then
    install -dm755 "${pkgdir}/usr/share/pinshot"
    cp -r share/pinshot/ocr "${pkgdir}/usr/share/pinshot/ocr"
  fi

  install -Dm644 share/applications/io.github.dgxz99.pinshot.desktop \
    "${pkgdir}/usr/share/applications/io.github.dgxz99.pinshot.desktop"
  install -Dm644 share/icons/hicolor/scalable/apps/io.github.dgxz99.pinshot.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.dgxz99.pinshot.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
