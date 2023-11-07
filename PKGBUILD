pkgname=perl-devel-nytprof
pkgver=6.14
pkgrel=1
_author='J/JK/JKEENAN'
_perlmod='Devel-NYTProf'
pkgdesc='Devel::NYTProf - Powerful fast feature-rich perl source code profiler'
url='https://metacpan.org/dist/Devel-NYTProf/'
depends=(
perl-capture-tiny
perl-sub-name
perl-getopt-long
perl-test-simple
perl-xsloader
perl-test-differences
perl-file-which
perl-json-maybexs
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
source=("https://cpan.metacpan.org/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('ac24dd7da5b2247696becefc15ca935484367743aad44cb2c8cfa17a29ad8e03')
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
# for nytprofhtml
#   ln -s /usr/bin/vendor_perl/nytprofcalls "$pkgdir"/usr/bin/nytprofcalls
#   ln -s /usr/bin/vendor_perl/flamegraph.pl "$pkgdir"/usr/bin/flamegraph.pl
}
