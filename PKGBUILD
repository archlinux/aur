# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Contributor: gilcu3 <gilcu3 at gmail dot com>

pkgname=perl-conf-libconfig
_perl_namespace=Conf
_perl_module=Libconfig
_perl_author_path=C/CN/CNANGEL
pkgver=1.0.3
pkgrel=1
pkgdesc=" Conf::Libconfig Perl extension for libconfig"
arch=('any')
url="https://metacpan.org/release/${_perl_namespace}-${_perl_module}"
license=('BSD')
depends=('perl' 'libconfig')
makedepends=('perl-test-pod' 'perl-test-pod-coverage' 'perl-test-deep' 'perl-test-warn' 'perl-test-exception')

source=("https://cpan.metacpan.org/authors/id/${_perl_author_path}/${_perl_namespace}-${_perl_module}-${pkgver}.tar.gz")
sha256sums=('e107f4b3d09f2b37db5a38ccce36ad945b82b89e5202b6bd01d3bb50a5965a1a')
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
