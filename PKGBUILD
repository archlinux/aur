# Maintainer: Ionut Biru <ibiru@archlinux.org>
pkgname=telepathy-logger
pkgver=0.8.2
pkgrel=3
pkgdesc="Telepathy framework logging daemon"
arch=(x86_64)
url="http://telepathy.freedesktop.org/wiki/Logger"
license=('LGPL2.1')
depends=('telepathy-glib' 'sqlite' 'libxml2' 'dconf')
makedepends=('intltool' 'gobject-introspection' 'libxslt' 'python2')
source=(https://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.bz2{,.asc})
md5sums=('c2f6a31c76cbdf8790500cf4f872ba71'
         'SKIP')
validpgpkeys=('5113B855236702158C41C366432705FACDD40325')

build() {
  cd "$pkgname-$pkgver"

  PYTHON=python2 ./configure --prefix=/usr \
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
