# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=cogl
pkgver=1.17.4
pkgrel=1
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('mesa' 'libdrm' 'libxext' 'libxdamage' 'libxcomposite' 'gdk-pixbuf2' 'pango' 'libxrandr')
makedepends=('gobject-introspection')
options=(!emptydirs)
source=(http://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('573c4ee7335fc4d4d1578e9103191e260fcaab8a80dfd20464c70444a74cbaaf')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --enable-gles{1,2} \
    --enable-{kms,wayland}-egl-platform \
    --enable-wayland-egl-server

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
