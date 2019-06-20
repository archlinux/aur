pkgname=vte3-ng
_basever=0.56.2
pkgver=$_basever.a
pkgrel=1
pkgdesc="Enhanced Virtual Terminal Emulator widget for use with GTK3 (patched with support for fullwidth emoji)"
arch=('x86_64')
license=('LGPL')
options=('!emptydirs')
depends=('gtk3' 'vte-common' 'pcre2')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gtk-doc' 'gperf')
url="https://github.com/thestinger/vte-ng"
source=(https://github.com/thestinger/vte-ng/archive/$pkgver.tar.gz)
sha256sums=('28162f4318cb51a74070dbcc57b6900f7a1de2616cab843a2431fd5cb67fccb3')
provides=(vte3=$_basever vte3-ng)
conflicts=(vte3)

build() {
  cd "vte-ng-$pkgver"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte \
      --localstatedir=/var --disable-static \
      --enable-introspection
  make
}

package() {
  cd "vte-ng-$pkgver"
  make DESTDIR="$pkgdir" install

  rm "$pkgdir/etc/profile.d/vte.sh"
}
