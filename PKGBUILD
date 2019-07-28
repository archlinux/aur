# Maintainer: Ben <ben@ported.pw>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=cups-bjnp
pkgver=2.0.1
pkgrel=2
pkgdesc='CUPS back-end for the canon printers using the proprietary USB over IP BJNP protocol'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/cups-bjnp/'
license=('GPL')
depends=('libcups')
makedepends=('cups')
source=("http://downloads.sourceforge.net/sourceforge/cups-bjnp/cups-bjnp-${pkgver}.tar.gz")
sha256sums=('95b5940daf6ee46120efef9c05048ade9bb855de36280c140895f9672b2946c0')

build() {
  cd cups-bjnp-${pkgver}

  # Patch for https://gcc.gnu.org/onlinedocs/gcc-8.1.0/gcc/Warning-Options.html#index-Wstringop_002dtruncation
  sed -i 's/strncpy/memcpy/' bjnp-commands.c

  ./configure --prefix='/usr'
  make
}

package() {
  cd cups-bjnp-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
