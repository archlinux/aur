pkgname=vte3-ng
_basever=0.50.2
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
sha256sums=('5d17f9d43b8b7401b45548370df733c67b6fcd194df067943421b548a331666b')
provides=(vte3=$_basever vte3-select-text=$_basever vte3-ng)
conflicts=(vte3 vte3-select-text vte3-ng)
replaces=(vte3-select-text vte3-ng)

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
