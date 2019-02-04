# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=xaos
pkgver=3.6
pkgrel=7
pkgdesc='Interactive fractal zoomer'
arch=(x86_64)
url='http://matek.hu/xaos/'
license=(GPL)
makedepends=(gendesk)
depends=(gsl gtk3 libpng)
options=(!makeflags)
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('989f3e38f7793810cbb1496d5291d44836a7d7c058422b9ee1cffb163a0b8d95')

prepare() {
  gendesk -f -n --pkgname=$pkgname --pkgdesc="$pkgdesc" \
    --categories='Application;Graphics'
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --with-long-double=yes \
    --with-mitshm=no \
    --with-pthread=yes \
    --with-png=yes \
    --with-gsl=yes \
    --with-x11-driver=no \
    --with-gtk-driver=yes \
    --with-win32-driver=no \
    --with-aa-driver=yes
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install

  install -Dm644 "$pkgname-$pkgver/src/ui/ui-drv/qt/images/xaosbig.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim: ts=2 sw=2 et:
