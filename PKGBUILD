# $Id$
# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=perl-cpan-reporter
pkgver=1.2017
_author=D/DA/DAGOLDEN
_perlmod=CPAN-Reporter
pkgrel=1
pkgdesc='CPAN::Reporter - Adds CPAN Testers reporting to CPAN.pm'
arch=('any')
url="http://search.cpan.org/dist/CPAN-Reporter/"
license=('GPL' 'PerlArtistic')
depends=(
perl-capture-tiny
perl-config-tiny
perl-devel-autoflush
perl-test-reporter
)
makedepends=(
perl-capture-tiny
perl-config-tiny
perl-devel-autoflush
perl-test-reporter
perl-probe-perl
)
checkdepends=(
perl-file-copy-recursive
perl-file-pushd
perl-io-captureoutput
)
provides=(
perl-cpan-reporter-api
perl-cpan-reporter-config
perl-cpan-reporter-faq
perl-cpan-reporter-history
perl-cpan-reporter-prereqcheck
)
optdepends=('perl-test-reporter-transport-metabase: Metabase transport')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('fb8e3050ff5332881b3c63d34a8e960e7d02d16f79c6e360f7a489c4e656b36c')
build(){
  cd "$srcdir"/$_perlmod-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
  /usr/bin/perl Makefile.PL
  make
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
