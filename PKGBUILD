# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=polo
pkgver=1.0.2
pkgrel=1
pkgdesc="Window manager, compositor, and session authority for the MATE Wayland desktop"
arch=('x86_64')
url="https://github.com/KeremSoke/polo/"
license=('GPL-3.0-or-later')
depends=('gtk3' 'gtk-layer-shell' 'wayland' 'libxkbcommon' 'libinput' 'libevdev'
         'seatd' 'systemd' 'libdisplay-info' 'lcms2' 'libcanberra' 'libsm' 'libice'
         'mate-desktop' 'libpulse' 'python-xlib' 'python-pyyaml' 'json-glib' 'xdg-desktop-portal-gtk')
makedepends=('vala' 'meson' 'wayland-protocols')
optdepends=('xdg-desktop-portal-wlr: screen sharing'
            'grim: screenshot keys'
            'xorg-xwayland: X11 applications'
            'wl-clipboard: screenshots to the clipboard'
            'slurp: area screenshots')
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('15b13c91b89d49894cf186edf124df7be945785427e3e04969a5e37f4551b47b')

build() {
  local meson_options=(
  )
  arch-meson "${pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
