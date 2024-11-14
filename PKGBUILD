# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-network-displays
pkgver=0.94.0
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
  'glib2-devel'
  'meson'
)
optdepends=(
  'gstreamer-vaapi'
)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('317f1017f18167156e8d0a78f9ba4a64bd8b66a2ab9114fccbbdb95423b43043')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
