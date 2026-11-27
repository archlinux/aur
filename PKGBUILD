# Maintainer: daguo <dgxz99@users.noreply.github.com>

pkgname=pinshot-bin
pkgver=0.1.1
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
sha256sums_x86_64=('a8c1a41b3fca206ba0c61a180aacf8b2f65b37f7b81b7e2309038f2949a64b3d')

package() {
  cd "pinshot-v${pkgver}-linux-${CARCH}"
  install -Dm755 bin/pinshot "${pkgdir}/usr/bin/pinshot"

  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions"
  cp -r share/gnome-shell/extensions/pinshot@dgxz99 \
    "${pkgdir}/usr/share/gnome-shell/extensions/pinshot@dgxz99"

  install -Dm644 share/applications/io.github.dgxz99.pinshot.desktop \
    "${pkgdir}/usr/share/applications/io.github.dgxz99.pinshot.desktop"
  install -Dm644 share/icons/hicolor/scalable/apps/io.github.dgxz99.pinshot.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.dgxz99.pinshot.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
