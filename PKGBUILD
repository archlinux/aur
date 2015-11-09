# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: foutrelis
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=libcaca
pkgname=libcaca-dev
pkgver=0.99.beta19
pkgrel=1
pkgdesc="Color AsCii Art library, newest"
arch=('i686' 'x86_64')
license=('custom:WTFPL')
url="http://caca.zoy.org/wiki/libcaca"
depends=('imlib2' 'ncurses')
options=(!emptydirs)
source=(http://libcaca.zoy.org/files/libcaca/${_pkgname}-${pkgver}.tar.gz)
md5sums=('a3d4441cdef488099f4a92f4c6c1da00')
conflicts=(libcaca)
replaces=(libcaca)
provides=(libcaca)

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --enable-shared --disable-doc \
    --disable-cxx --disable-gl --disable-csharp --disable-static
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/libcaca/COPYING"
}
