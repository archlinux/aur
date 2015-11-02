# Maintainer: nullmark
# Old Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=colord-nopolkit
pkgver=1.0.1
pkgrel=1
pkgdesc="Color daemon widthout polkit"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/software/colord"
license=('GPL2')
depends=('lcms2' 'sqlite3' 'udev')
makedepends=('intltool' 'gobject-introspection' 'vala' 'docbook2x')
source=($url/releases/colord-$pkgver.tar.xz)
options=('!libtool')
sha256sums=('053f028aba6071068064ca7fe949bb3f74fb5ad16af2d7ec5bba10dea00cb785')
provides=('colord')
conflicts=('colord')

build() {
  cd "$srcdir/colord-$pkgver"
  ./configure --prefix=/usr \
    --sysconfdir=/etc --libexecdir=/usr/lib/colord \
    --localstatedir=/var --disable-static \
    --disable-polkit
  make
}

package() {
  cd "$srcdir/colord-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

