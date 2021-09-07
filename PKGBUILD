# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.9.0+1+g463df6e
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-python' 'python-gobject' 'gst-plugin-gtk' 'gst-plugins-good' 'libnm'
         'python-pillow' 'python-logbook' 'python-single-version' 'zbar'
         'python-kiss-headers')
makedepends=('git' 'meson' 'gobject-introspection')
checkdepends=('appstream-glib')
_commit=463df6e9b50bda20e0fb0029e5512cb809d3c86b
source=("git+https://github.com/hongquan/CoBang.git#commit=463df6e9b50bda20e0fb0029e5512cb809d3c86b")
#source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/CoBang
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  arch-meson CoBang build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
