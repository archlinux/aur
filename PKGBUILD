pkgname=wall-it-git
pkgver=2.1.0.r8.gee186b3
pkgrel=1
pkgdesc="Professional modular wallpaper manager for Wayland desktops"
arch=('any')
url="https://github.com/DiscoCevapi/Wall-IT"
license=('custom')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'python-pillow'
  'python-numpy'
)
optdepends=(
  'awww: wallpaper daemon backend used by start-wall-it'
  'matugen: Material You color generation'
  'python-cairo: enhanced icon drawing support in GUI'
  'keyd: global keybind helper integration'
)
makedepends=('git')
provides=('wall-it')
conflicts=('wall-it')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/Wall-IT"
  printf "2.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _src="${srcdir}/Wall-IT"

  install -dm755 "${pkgdir}/usr/lib/wall-it"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m644 "${_src}/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/README.md"

  install -m755 "${_src}/start-wall-it" "${pkgdir}/usr/lib/wall-it/start-wall-it"
  install -m755 "${_src}/wall-it-next" "${pkgdir}/usr/lib/wall-it/wall-it-next"
  install -m755 "${_src}/wall-it-prev" "${pkgdir}/usr/lib/wall-it/wall-it-prev"
  install -m755 "${_src}/wallpaper-gui.py" "${pkgdir}/usr/lib/wall-it/wallpaper-gui.py"
  install -m755 "${_src}/wall-it-backend-manager.py" "${pkgdir}/usr/lib/wall-it/wall-it-backend-manager.py"
  install -m755 "${_src}/wall-it-common.py" "${pkgdir}/usr/lib/wall-it/wall-it-common.py"
  install -m755 "${_src}/wall-it-config.py" "${pkgdir}/usr/lib/wall-it/wall-it-config.py"
  install -m755 "${_src}/wall-it-hyprland-backend.py" "${pkgdir}/usr/lib/wall-it/wall-it-hyprland-backend.py"
  install -m755 "${_src}/wall-it-image-processor.py" "${pkgdir}/usr/lib/wall-it/wall-it-image-processor.py"
  install -m755 "${_src}/wall-it-kde-backend.py" "${pkgdir}/usr/lib/wall-it/wall-it-kde-backend.py"
  install -m755 "${_src}/wall-it-keybind-config.py" "${pkgdir}/usr/lib/wall-it/wall-it-keybind-config.py"
  install -m755 "${_src}/wall-it-keyd-manager.py" "${pkgdir}/usr/lib/wall-it/wall-it-keyd-manager.py"
  install -m755 "${_src}/wall-it-labwc-backend.py" "${pkgdir}/usr/lib/wall-it/wall-it-labwc-backend.py"
  install -m755 "${_src}/wall-it-monitor-state.py" "${pkgdir}/usr/lib/wall-it/wall-it-monitor-state.py"
  install -m755 "${_src}/wall-it-tray.py" "${pkgdir}/usr/lib/wall-it/wall-it-tray.py"
  install -m755 "${_src}/wall-it-weather-overlay.py" "${pkgdir}/usr/lib/wall-it/wall-it-weather-overlay.py"
  install -m755 "${_src}/wall_it_keybind_config.py" "${pkgdir}/usr/lib/wall-it/wall_it_keybind_config.py"

  install -m755 "${_src}/packaging/bin/wall-it" "${pkgdir}/usr/bin/wall-it"
  install -m755 "${_src}/packaging/bin/wall-it-gui" "${pkgdir}/usr/bin/wall-it-gui"
  install -m755 "${_src}/packaging/bin/wall-it-start" "${pkgdir}/usr/bin/wall-it-start"
  install -m755 "${_src}/packaging/bin/wall-it-next" "${pkgdir}/usr/bin/wall-it-next"
  install -m755 "${_src}/packaging/bin/wall-it-prev" "${pkgdir}/usr/bin/wall-it-prev"
  ln -sf wall-it-start "${pkgdir}/usr/bin/start-wall-it"

  install -m644 "${_src}/wall-it.desktop" "${pkgdir}/usr/share/applications/wall-it.desktop"
  install -m644 "${_src}/assets/wall-it.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wall-it.svg"
}
