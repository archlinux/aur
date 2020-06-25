# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-panel
pkgname=${_pkgname}-devel
pkgver=4.15.3
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment (development release)"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('exo' 'garcon' 'libxfce4ui>=4.15.1' 'xfconf' 'libwnck3' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'vala' 'python') #for gdbus-codegen
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('4746c7153c7c7ff53273a36a8ab88eb77acab303890c76f12c4ebffd7e6d9cef')

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
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
