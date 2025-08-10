# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
_pkgname="cwcwm"
pkgname="cwc"
pkgver=0.2.0
pkgrel=1
pkgdesc='Extensible Wayland compositor with dynamic window management'
arch=('x86_64')
url="https://github.com/Cudiph/cwcwm"
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'hyprcursor'
  'libdrm'
  'libinput'
  'libwlroots-0.19.so'
  'libxcb'
  'libxkbcommon'
  'luajit-lgi'
  'luajit'
  'pango'
  'wayland'
  'xorg-xwayland'
  'xxhash'
)
makedepends=(
  'ldoc'
  'meson'
  'ninja'
  'wayland-protocols'
)
optdepends=(
  'brightnessctl: Default brightness controller in the configuration'
  'copyq: Default clipboard manager'
  'rofi-wayland: Default application launcher'
  'playerctl: Default media player controller'
  'swaybg: Default wallpaper'
  'swayidle: Default idle daemon'
  'waybar: Default bar'
  'xdg-desktop-portal-gtk: Default portal for file picker'
  'xdg-desktop-portal-wlr: Portal for screen sharing'
)

source=("https://github.com/Cudiph/cwcwm/archive/v$pkgver.tar.gz")
md5sums=('baf871485f2a60ec99d2bda73b034065')

provides=('wayland-compositor')

build() {
  cd "$_pkgname-$pkgver" || exit 1
  meson setup build -Dplugins=true --buildtype=release --prefix /usr --reconfigure
  ninja -C build
  make docs
}

package() {
  cd "$_pkgname-$pkgver" || exit 1
  DESTDIR="$pkgdir" make install
}
