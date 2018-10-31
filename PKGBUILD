# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='Term-ReadLine-Perl5'

pkgname=perl-term-readline-perl5
pkgver=1.45
pkgrel=1
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('any')
license=('PerlArtistic' 'GPL2')
url="https://metacpan.org/release/${_distname}"
depends=('perl'
         'perl-file-homedir'
         'perl-term-readkey'
         'perl-class-accessor-lite'
         'perl-text-visualwidth-pp'
         'perl-unicode-eastasianwidth-detect')
makedepends=('perl-module-build')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RO/ROCKY/${_distname}-${pkgver}.tar.gz")
sha512sums=('7b9c7487c27abb7739886b975874efcd26f7214633cdc727d8ae3bd4ceaa9162172134e046adc2cb63179775941d84888771b9bb74840aa3edbde6cca85c0f61')

build() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps' MODULEBUILDRC='/dev/null'
  perl Build.PL
  ./Build
}

check() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1'
  ./Build test
}

package() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs vendor --destdir "${pkgdir}"
  find "${pkgdir}" \( -name perllocal.pod -or -name .packlist \) -delete
}

# vim:set ts=2 sw=2 et:
