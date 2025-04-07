# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-network-displays
pkgver=0.96.0
pkgrel=1
pkgdesc="Screencasting for GNOME. Supports the Miracast and Chromecast protocols."
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
sha256sums=('454607156dad00f7ac8af9f6cfb5f849e5b56700f6578c5f50550b7e34e423f6')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
