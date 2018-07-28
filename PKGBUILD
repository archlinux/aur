# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-devel-checkos'
pkgver='1.81'
pkgrel='1'
pkgdesc="check what OS we're running on"
_dist='Devel-CheckOS'
arch=('any')
url="http://search.cpan.org/dist/Devel-CheckOS"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.006' 'perl-file-find-rule>=0.28' 'perl-data-compare>=1.21')
options=('!emptydirs' purge)
makedepends=('perl-extutils-makemaker')
checkdepends=()
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/${_dist}-${pkgver}.tar.gz")
sha512sums=('359a48002d196bbc66006cf9a79d8995050b7fd2bae6dedbad4c182f23be9c7b1f8977f796833a22b42cff1ecaa6380895883952236c8c5bb4dee7cdf4072a39')

sanitize() {
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
}

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  make test
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"
  sanitize
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
