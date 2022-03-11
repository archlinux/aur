# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=audio-sharing
pkgver=0.2.0
pkgrel=1
pkgdesc="Share your computer audio"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/de.haeckerfelix.AudioSharing"
license=('GPL3')
depends=('gst-rtsp-server' 'libadwaita')
makedepends=('cargo' 'git' 'meson')
source=("https://gitlab.gnome.org/World/AudioSharing/-/archive/$pkgver/AudioSharing-$pkgver.tar.gz")
sha256sums=('d47da7fcb1a64272e1c05229a8e8bef9fa560cace855c51c7d3273a3a67ce7be')

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
