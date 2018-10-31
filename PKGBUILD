# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=perl-rlib
_realname=rlib
pkgver=0.02
pkgrel=1
pkgdesc="Perl/CPAN Module rlib"
arch=('any')
license=('custom:unknown')
url="https://metacpan.org/release/${_realname}"
depends=('perl')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/G/GB/GBARR/${_realname}-${pkgver}.tar.gz")
sha512sums=('cb9ed13db8a5709e19464412d46f8d818004d8cac339ec78e6314c1f05cadde784a4454f654b5db5ae17ed25b2107b8e3e7b68766405a270b67c06fed6defaa5')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'

  perl Makefile.PL INSTALLDIRS=vendor

  make
}

check () {
  cd "${srcdir}/${_realname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT

  make install DESTDIR="$pkgdir"

  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
