# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=polo
pkgver=1.1.0
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
            'xorg-xwayland: X11 applications'
            'mate-utils>=1.29.0: screenshots')
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f171060ead593215eaf32a7bb224fda3aab4c2a73c35d27c530749a7061ea10b')

build() {
  local meson_options=(
  )
  arch-meson "${pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
