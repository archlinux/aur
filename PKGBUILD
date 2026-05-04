# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=laser
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple CD ripper for the GNOME desktop."
arch=('any')
url="https://codeberg.org/andreasknoben/Laser"
license=('GPL-3.0-or-later')
depends=(
  'cd-discid'
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
sha256sums=('16e62c4418dbbdc82c3554541cb0fb16b983af991efb67a7a37baa13658e54cc')

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
