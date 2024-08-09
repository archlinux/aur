# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-network-displays-git
pkgver=0.93.0.r2.g3738a2b
pkgrel=1
pkgdesc="Miracast implementation for GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL-3.0-or-later')
depends=(
  'avahi'
  'dnsmasq'
  'gst-plugin-pipewire'
  'gst-plugins-bad'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gst-rtsp-server'
  'libadwaita'
  'libportal-gtk4'
  'libpulse'
  'networkmanager'
  'protobuf-c'
  'xdg-desktop-portal'
)
makedepends=(
  'git'
  'glib2-devel'
  'meson'
)
optdepends=(
  'gstreamer-vaapi'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/gnome-network-displays.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
