# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: James Rayner <iphitus@gmail.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=perl-unicode-string
_realname=Unicode-String
pkgver=2.09
pkgrel=9
pkgdesc="String of Unicode characters for perl (UCS2/UTF16)"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/${_realname}-${pkgver}.tar.gz fix-defined-hash-deprecation-warning.patch)
md5sums=('553e68e603723bf7c631f8701ab0d678'
         '0e8fdf57951ea92d60832fce7514e1d0')

prepare() {
  cd "${srcdir}/${_realname}-${pkgver}"
  patch -uNp1 -i ../fix-defined-hash-deprecation-warning.patch
}

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  # in stall module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
