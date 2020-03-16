# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-panel
pkgname=${_pkgname}-vala0.48fix
pkgver=4.14.3
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'xfconf' 'libwnck3' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gobject-introspection' 'vala')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
source=(https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
        'vala0.48_fix.patch::https://bugzilla.xfce.org/attachment.cgi?id=9486')
sha256sums=('ef22324d26e5af735134bb10f85b6e16525ac9f48be8d2f6b634142fbfcabbc9'
            '0aba3594b0e4dce91f85187df69ef16f1dc061c82b137fe81adc8b6672444659')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i ../vala0.48_fix.patch
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
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
