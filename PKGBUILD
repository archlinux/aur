# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>

_pkgbasename=giflib
pkgname=lib32-$_pkgbasename
pkgver=5.1.8
pkgrel=1
pkgdesc="A library for reading and writing gif images (32-bit)"
url="http://sourceforge.net/projects/giflib/"
arch=('x86_64')
license=('MIT')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('xmlto' 'docbook-xsl' 'docbook-xml')
source=(https://downloads.sourceforge.net/project/giflib/${_pkgbasename}-${pkgver}.tar.gz)
sha512sums=('d390917837a64de1912720ab8968e6b077c6be9f9a2f835faced44420f54d6d55d4e3543b9779ec65d399858856188fea93c170b253d0b83928f15548a14aba3')

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
