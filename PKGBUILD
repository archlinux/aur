# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Christian Sturm <reezer@reezer.org>

pkgname=perl-ppix-regexp
_perl_namespace=PPIx
_perl_module=Regexp
pkgver=0.062
pkgrel=1
pkgdesc="Represent a regular expression of some sort"
arch=('any')
url="https://metacpan.org/release/${_perl_namespace}-${_perl_module}"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-list-moreutils' 'perl-task-weaken' 'perl-ppi')
source=("http://cpan.metacpan.org/authors/id/W/WY/WYANT/${_perl_namespace}-${_perl_module}-${pkgver}.tar.gz")
sha256sums=('1218fe4c94b3cb9d894c6cd8a69bb4172eac54ce083b70f7a8bf13868a5a0733')
options=('!emptydirs')

build() {
  cd "${_perl_namespace}-${_perl_module}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL
  make
}

check() {
  cd "${_perl_namespace}-${_perl_module}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${_perl_namespace}-${_perl_module}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
  # Delete unuseful files
  find "${pkgdir}" -name '.packlist' -delete
}
