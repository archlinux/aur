# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname="Syntax-Highlight-Perl-Improved"

pkgname=perl-syntax-highlight-perl-improved
pkgver=1.01
pkgrel=1
pkgdesc="Perl/CPAN Module ${_distname//-/::}"
arch=('any')
license=('custom:unknown')
options=('!emptydirs')
depends=('perl')
url="https://metacpan.org/release/${_distname}"
source=("https://cpan.metacpan.org/authors/id/D/DA/DAVIDCYL/Syntax-Highlight-Perl-Improved-101/${_distname}-${pkgver}.tar.gz")
sha512sums=('13230a0bde3648aca6bf91b5fed4b932375041eafe4f0419c0ba774fdb9b5ea9284579e6052e8507c7c8f7f13d337cfb0e544ae6d99119a3b63834a868dc6731')

prepare() {
  cd "${srcdir}/${_distname}-${pkgver}"
}

build() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
  perl Makefile.PL INSTALLDIRS='vendor'
  make
}

check() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1'
  make test
}

package() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="${pkgdir}"
  find "${pkgdir}" \( -name .packlist -or -name perllocal.pod \) -delete
}

# vim:set ts=2 sw=2 et:
