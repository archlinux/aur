pkgname=wallpygui
pkgver=0.0.1
pkgrel=1
pkgdesc='GTK4 wallpaper manager for Wayland desktops'
arch=('any')
url='https://github.com/jR4dh3y/wallpygui'
license=('MIT')
depends=(
  'awww'
  'ffmpeg'
  'gtk4'
  'mpvpaper'
  'python'
  'python-gobject'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7144e7c9b3f81fb816b5fc3ad95cfcabe289f0b33d273dfa4f97950286703384')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 wallpygui.py "${pkgdir}/usr/share/${pkgname}/wallpygui.py"
  cp -a src "${pkgdir}/usr/share/${pkgname}/src"

  install -Dm644 wallpygui.desktop "${pkgdir}/usr/share/applications/wallpygui.desktop"
  install -Dm644 assets/wallpygui.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wallpygui.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/wallpygui" <<'EOF'
#!/bin/sh
exec python3 /usr/share/wallpygui/wallpygui.py "$@"
EOF
}
