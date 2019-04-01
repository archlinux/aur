# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>

_pkgbasename=giflib
pkgname=lib32-$_pkgbasename
pkgver=5.1.9
pkgrel=1
pkgdesc="A library for reading and writing gif images (32-bit)"
url="http://sourceforge.net/projects/giflib/"
arch=('x86_64')
license=('MIT')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('xmlto' 'docbook-xsl' 'docbook-xml')
source=(https://downloads.sourceforge.net/project/giflib/${_pkgbasename}-${pkgver}.tar.gz)
sha512sums=('b6350b39755e3eeba58b5fccf319bbaeee2db6564e13c8ce44d3652cc32d243c391def74b6b1529bc5e0d4573eff94b2ffa5faa90fc564a049122d3e23f1d184')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make CC="gcc -m32"
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  make PREFIX=/usr LIBDIR=/usr/lib32 DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  install -m755 -d ${pkgdir}/usr/share/licenses
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
