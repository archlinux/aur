# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: Kent Fredric <kentnl@cpan.org>
# Contributor: Petrenko Alexey <alexey-p at uralweb dot ru>

pkgname=perl-devel-nytprof
pkgver=6.04
pkgrel=1
_author='T/TI/TIMB'
_perlmod='Devel-NYTProf'
pkgdesc='Devel::NYTProf - Powerful fast feature-rich perl source code profiler'
url='http://search.cpan.org/dist/Devel-NYTProf'
depends=(
perl-json-any
perl-getopt-long
perl-test-simple
perl-xsloader
perl-test-differences
zlib
)
checkdepends=(
# perl-moose
# perl-test-portability-files
perl-test-pod-coverage
perl-test-portability-files
)
makedepends=(perl-extutils-makemaker)
arch=('i686' 'x86_64')
license=('GPL')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps MODULEBUILDRC=/dev/null
build(){
  cd "$srcdir"/$_perlmod-$pkgver

  perl Makefile.PL
  make
}
check(){
  cd "$srcdir"/$_perlmod-$pkgver
#   HARNESS_OPTIONS=j10 make test
  make test
}
package(){
  cd "$srcdir"/$_perlmod-$pkgver
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

  # remove perllocal.pod and .packlist
#   find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
#   install -dm755 "$pkgdir"/usr/bin
  # for nytprofhtml
#   ln -s /usr/bin/vendor_perl/nytprofcalls "$pkgdir"/usr/bin/nytprofcalls
#   ln -s /usr/bin/vendor_perl/flamegraph.pl "$pkgdir"/usr/bin/flamegraph.pl
}
sha256sums=('c04c9f03663b7e4e9cc159f30bcdc0bab5652889c88c425ec157e831318d4891')
