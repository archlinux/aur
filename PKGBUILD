# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=audio-sharing
pkgver=0.2.1
pkgrel=1
pkgdesc="Share your computer audio"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/de.haeckerfelix.AudioSharing"
license=('GPL3')
depends=('gst-rtsp-server' 'libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/World/AudioSharing/-/archive/$pkgver/AudioSharing-$pkgver.tar.gz")
sha256sums=('ed16b967e4480ebaf5114f432e8312693e48ef4059dead88fa403fb18b2d51cc')

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "AudioSharing-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
