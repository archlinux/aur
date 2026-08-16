# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=laser
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple CD ripper for the GNOME desktop."
arch=('any')
url="https://codeberg.org/andreasknoben/Laser"
license=('GPL-3.0-or-later')
depends=(
  'cd-discid'
  'cdrdao'
  'gstreamer'
  'gst-plugins-ugly'
  'gtk4'
  'libadwaita'
  'libcdio'
  'libcdio-paranoia'
  'libdiscid'
  'python-discid'
  'python-gobject'
  'python-musicbrainzngs'
  'python-pycdio'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
)
source=("git+https://codeberg.org/andreasknoben/Laser.git#tag=v$pkgver")
sha256sums=('e219a58f2f89678247cdce315143ade4c30c0a077f92353bda3a5e911de42bb4')

build() {
  arch-meson Laser build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
