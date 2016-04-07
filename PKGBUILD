# Maintainer: krimson32 <krims0n32 omnomnom gmail.com>
# Contributor: krimson32 <krims0n32 omnomnom gmail.com>

_pkgname=xfce4-panel
pkgname=${_pkgname}-hidpi
pkgver=4.12.0
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment with bigger icons in tasklist for HiDPI displays"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'libwnck' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gtk-doc')
conflicts=("${_pkgname}" "${_pkgname}-devel" "${_pkgname}-git")
provides=("${_pkgname}=${pkgver}")
install=$pkgname.install
source=(http://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2 xfce4-panel-hidpi.patch)
sha256sums=('30920fc2e2fc26279a82b5261a155c2cc15ab2aa1ced2275684a6ff8261b97b0'
            '5415a842fdd811a6bd5ac726c80110b663feee12b0847378559ed97846fb22fe')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 -i $srcdir/xfce4-panel-hidpi.patch
}


build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --enable-gtk3 \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
