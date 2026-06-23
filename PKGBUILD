# Maintainer: animawave <animawave@github.com>
pkgname=animawave-git
pkgver=5.0.0
pkgrel=2
pkgdesc="Internet radio player (fork of shortwave)"
arch=('x86_64' 'aarch64')
url="https://github.com/animaios/animawave"
license=('GPL-3.0-or-later')
depends=(
  'gtk4' 'libadwaita' 'libshumate'
  'gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good'
  'gst-libav' 'gst-plugin-gtk4'
  'sqlite' 'openssl'
)
makedepends=(
  'rust' 'cargo' 'meson' 'ninja'
  'glib2' 'gtk4' 'libadwaita'
)
optdepends=(
  'gst-plugins-ugly: additional codecs'
)
conflicts=('animawave' 'shortwave')
provides=('animawave' 'shortwave')
replaces=('shortwave')
source=("$pkgname::git+https://github.com/animaios/animawave.git")
sha256sums=('SKIP')

pkgver="5.0.0"

build() {
  cd "$srcdir/$pkgname"
  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" meson install -C build
}