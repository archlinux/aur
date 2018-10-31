# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=perl-devel-callsite
_realname=Devel-Callsite
pkgver=1.0.1
pkgrel=1
pkgdesc="Perl/CPAN Module ${_realname//-/::}"
arch=('i686' 'x86_64')
license=('PerlArtistic')
url="https://metacpan.org/release/${_realname}"
depends=('perl')
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/R/RO/ROCKY/${_realname}-${pkgver}.tar.gz")
sha512sums=('57b1615320c80a2f877d071f09eb733634f8a7c75a43c232b38f86e4f654245d84b1b971748b46a6048a8f5c1297b064204165d1497f7f08d1e2f6c6dd5c00cb')

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
  export PERL_MM_USE_DEFAULT='1'
  make test
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT

  make install DESTDIR="${pkgdir}"

  find "${pkgdir}" \( -name perllocal.pod -or -name .packlist \) -delete
}

# vim:set ts=2 sw=2 et:
