# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>

_pkgbasename=giflib
pkgname=lib32-$_pkgbasename
pkgver=5.1.2
pkgrel=1
pkgdesc="A library for reading and writing gif images (32-bit)"
url="http://sourceforge.net/projects/giflib/"
arch=('x86_64')
license=('MIT')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('xmlto' 'docbook-xsl' 'docbook-xml')
source=(http://downloads.sourceforge.net/sourceforge/giflib/${_pkgbasename}-${pkgver}.tar.bz2)
md5sums=('323a9f11ab56c8a2d1715376410ce376')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${srcdir}/${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-static
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  install -m755 -d ${pkgdir}/usr/share/licenses
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
