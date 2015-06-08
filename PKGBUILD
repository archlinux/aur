# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=lib32-rest
_pkgname=rest
pkgver=0.7.93
pkgrel=1
pkgdesc="A helper library for RESTful services (lib32)"
arch=("x86_64")
url="http://www.gtk.org/"
license=(GPL2)
depends=('rest' 'lib32-glib2' 'lib32-libxml2' 'lib32-libsoup')
makedepends=("gobject-introspection")
source=(http://download.gnome.org/sources/${_pkgname}/${pkgver:0:3}/${_pkgname}-${pkgver}.tar.xz)
md5sums=('1c276e7808edf8e2e49ed854f741cd40')


build() {
export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
cd ${_pkgname}-${pkgver}
./configure \
  --prefix=/usr \
  --sysconfdir=/etc \
  --libdir=/usr/lib32 --libexecdir=/usr/lib32
  make
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR="$pkgdir" install

cd "$pkgdir/usr"
rm -rf {include,share}/
}


