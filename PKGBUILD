# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-rrdtool-oo'
pkgver='0.36'
pkgrel='1'
pkgdesc="Object-oriented interface to RRDTool"
_dist='RRDTool-OO'
arch=('any')
url='http://search.cpan.org/dist/RRDTool-OO'
license=('PerlArtistic' 'GPL')
depends=('rrdtool' 'perl>=5.6.0' 'perl-log-log4perl>=0.40')
options=('!emptydirs' purge)
makedepends=('perl-extutils-makemaker>=6.59')
checkdepends=('perl-test-requires')
provides=("RRDTool::OO=${pkgver}" "perl-rrdtool-oo=${pkgver}")
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSCHILLI/${_dist}-${pkgver}.tar.gz")
sha512sums=('5013c848ff777b41b022ddfe900fe157e981e2724420c84703849ba413f13d47a3b39fa05a01e616419cac9005abec2e74bc8647ad2adfcf3ceaa0d002fb3d0a')

sanitize() {
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
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
