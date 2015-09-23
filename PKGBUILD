# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=lib32-json-glib
_pkgbasename=json-glib
pkgver=1.0.4
pkgrel=1
pkgdesc="JSON library built on GLib"
arch=('i686' 'x86_64')
url="http://live.gnome.org/JsonGlib"
license=('GPL')
depends=('lib32-glib2' "$_pkgbasename")
makedepends=('gobject-introspection')
options=('!libtool')
install=$pkgname.install
source=("http://ftp.gnome.org/pub/GNOME/sources/${_pkgbasename}/1.0/${_pkgbasename}-${pkgver}.tar.xz")
sha256sums=('80f3593cb6bd13f1465828e46a9f740e2e9bd3cd2257889442b3e62bd6de05cd')

build(){
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${srcdir}/${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package(){
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

check(){
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make check
}
