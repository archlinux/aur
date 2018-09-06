#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Daniel Golle

pkgname=perl-digest-crc
_realname=Digest-CRC
pkgver=0.18
pkgrel=2
pkgdesc="Generic interface to CRC algorithms"
arch=('i686' 'x86_64')
license=('PerlArtistic')
url="https://metacpan.org/release/Digest-CRC"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/O/OL/OLIMAUL/$_realname-${pkgver}.tar.gz")
sha256sums=('5c5329f37c46eb79835169508583da8767d9839350b69bb2b48ac6f594f70374')

build() {
  cd "${srcdir}${_realname}-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'

  perl Makefile.PL INSTALLDIRS=vendor

  make
}

package() {
  cd "${srcdir}${_realname}-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT

  make install DESTDIR="$pkgdir"

  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
