# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=cogl
pkgver=1.14.0
pkgrel=2
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('libdrm' 'libxext' 'libxdamage' 'libxcomposite' 'gdk-pixbuf2' 'pango')
makedepends=('mesa' 'gobject-introspection')
options=(!libtool !emptydirs)
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('276e8c9f5ff0fcd57c1eaf74cc245f41ad469a95a18ac831fac2d5960baa5ae8')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --enable-wayland-egl-{platform,server} --enable-gles{1,2}
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
