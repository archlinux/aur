# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vte290
pkgver=0.34.0
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3 (vte-2.90 API)"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('LGPL')
depends=('gtk3' 'vte-common')
makedepends=('intltool' 'gobject-introspection' 'python2')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.xz::http://download.gnome.org/sources/vte/${pkgver::4}/vte-${pkgver}.tar.xz")
sha256sums=('8b5d4dcd84e36f6a89c7d747978387a3ed3eda5806a383530226dd30b0e4af53')

build() {
  cd "$srcdir/vte-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/vte \
    --localstatedir=/var \
    --disable-static \
    --enable-introspection
  make
}

package(){
  cd "$srcdir/vte-$pkgver"

  make DESTDIR="$pkgdir" install

  # Files below are provided by vte-common
  rm "$pkgdir/usr/lib/vte/gnome-pty-helper"
  rm "$pkgdir/etc/profile.d/vte.sh"
}
# vim:set ts=2 sw=2 et: