# Contributor: bb010g <bb010g@bb010g.com>
pkgname=perl-cgi-compile
pkgver=0.25
pkgrel=1
pkgdesc='Compile .cgi scripts to a code reference like ModPerl::Registry'
_dist=CGI-Compile
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-file-pushd)
makedepends=(perl-module-build-tiny)
checkdepends=(perl-{cgi{,-emulate-psgi},switch,test-{nowarnings,requires}})
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RK/RKITOVER/$_dist-$pkgver.tar.gz")
md5sums=('f15c25f41cb592b992c0988ac6a08612')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL5LIB='.'
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
