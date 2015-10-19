# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-devel-checkos'
pkgver='1.76'
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
sha512sums=('e915281fdd57e6d804a7c2cd1c4fe5114ca02f61f7cc0ef0e9a9c8d23cb54f793d433804a301cc02d9a83fee34b71d9876795b133114c9697703ab7b1681353e')

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
