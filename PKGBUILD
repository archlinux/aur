pkgname=pango-ubuntu
_pkgbase=pango
pkgver=1.42.1
pkgrel=2
pkgdesc="A library for layout and rendering of text (for compat with cairo-ubuntu, fontconfig-ubuntu)"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libthai' 'cairo-ubuntu' 'libxft' 'harfbuzz')
provides=("pango=$pkgver")
replaces=('pango')
conflicts=('pango')
makedepends=('harfbuzz' 'fontconfig-ubuntu' 'cairo-ubuntu' 'libxft' 'libthai' 'gobject-introspection' 'help2man')
checkdepends=('ttf-dejavu')
install=pango.install
source=(http://ftp.gnome.org/pub/GNOME/sources//${_pkgbase}/${pkgver:0:4}/${_pkgbase}-${pkgver}.tar.xz)
url="http://www.pango.org/"

build() {
  cd ${_pkgbase}-${pkgver}

  rm -f pango-view/pango-view.1.in

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --with-included-modules=basic-fc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd ${_pkgbase}-${pkgver}
  make -k check || :
}

package() {
  cd ${_pkgbase}-${pkgver}
  make -j1 DESTDIR="${pkgdir}" install
}
md5sums=('d66d2f29e92d33b6da5e19c563520f7c')
