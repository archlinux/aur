# Maintainer: Jan Hicken <firstname [dot] lastname [at] hotmail [dot] de>

pkgname=networkmanager-strongswan
_pkgname=NetworkManager-strongswan
pkgver=1.3.1
pkgrel=2
pkgdesc="Strongswan NetworkManager plugin"
arch=('i686' 'x86_64')
url="http://wiki.strongswan.org/projects/strongswan/wiki/NetworkManager"
license=('GPL')
depends=(networkmanager strongswan libgnomeui)
makedepends=(intltool)
source=("http://download.strongswan.org/NetworkManager/$_pkgname-$pkgver.tar.gz"
        'fix-vbox-parent.patch')
sha256sums=('8f67bf0e7281ee8dfb1c7fe28ef8d06774744e2135682f4ddae4342fd103d46a'
            'c9f7f6819753ff2834015ba18ffed39c4b5ae5e0e71c377ee49c105f0d9b1f99')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i ../fix-vbox-parent.patch
}

build() {
  cd "$_pkgname-$pkgver"

  export CFLAGS="$CFLAGS -Wno-error=deprecated-declarations"
  ./configure --sysconfdir=/etc --prefix=/usr \
    --libexecdir=/usr/lib/networkmanager \
    --with-charon=/usr/lib/strongswan/charon-nm
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
