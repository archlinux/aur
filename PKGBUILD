# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=cogl
pkgver=1.15.10
pkgrel=2
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('libdrm' 'libxext' 'libxdamage' 'libxcomposite' 'gdk-pixbuf2' 'pango')
makedepends=('mesa' 'gobject-introspection')
options=(!libtool !emptydirs)
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('d82d5078f6b6d3c9369d0c190e34064ef3337fbdd06ecaf17e36f3a50f13a61c')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --enable-wayland-egl-platform --enable-gles{1,2} --enable-wayland-egl-server

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
