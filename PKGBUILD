# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=footage
pkgdesc="Trim, flip, rotate and crop individual clips. Footage is a useful tool for quickly editing short videos and screencasts. It's also capable of exporting any video into a format of your choice"
pkgver=1.2
pkgrel=1
arch=('any')
url="https://gitlab.com/adhami3310/Footage"
license=('GPL3')
depends=('a52dec' 'fdkaac' 'gst-editing-services' 'gst-plugins-rs'
         'libadwaita' 'libmpeg2' 'svt-av1' 'vo-aacenc' 'x264' 'x265')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson Footage build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlog
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 Footage/README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 Footage/COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
}
