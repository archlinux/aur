# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=lib32-json-glib
_pkgbasename=json-glib
pkgver=1.0.2
pkgrel=1
pkgdesc="JSON library built on GLib"
arch=('i686' 'x86_64')
url="http://live.gnome.org/JsonGlib"
license=('GPL')
depends=('lib32-glib2' "$_pkgbasename")
makedepends=('gobject-introspection')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgbasename}/1.0/${_pkgbasename}-${pkgver}.tar.xz)
sha256sums=('887bd192da8f5edc53b490ec51bf3ffebd958a671f5963e4f3af32c22e35660a')

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
