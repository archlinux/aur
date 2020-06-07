# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=telepathy-logger
pkgver=0.8.2
pkgrel=5
pkgdesc="Telepathy framework logging daemon"
arch=(x86_64)
url="http://telepathy.freedesktop.org/wiki/Logger"
license=('LGPL2.1')
depends=('telepathy-glib' 'sqlite' 'libxml2' 'dconf')
makedepends=('intltool' 'gobject-introspection' 'libxslt' 'python')
source=(https://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.bz2{,.asc}
        0001-tools-Fix-the-build-with-Python-3.patch)
sha256sums=('8fcad534d653b1b365132c5b158adae947810ffbae9843f72dd1797966415dae'
            'SKIP'
            'd94899bed85a4ac90158838524d16c761956eec2cd0d223b6a18bffa09ec008b')
validpgpkeys=('5113B855236702158C41C366432705FACDD40325')

prepare() {
  cd "$pkgname-$pkgver"
  # fix build with python3
  patch -Np1 -i ../0001-tools-Fix-the-build-with-Python-3.patch
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/telepathy \
    --enable-call \
    --disable-static \
    --disable-scrollkeeper \
    --disable-schemas-compile
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
