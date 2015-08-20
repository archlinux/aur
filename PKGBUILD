# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-math-random-isaac-xs'
pkgver=1.004
pkgrel=1
pkgdesc='C implementation of the ISAAC PRNG algorithm'
_dist='Math-Random-ISAAC-XS'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.6')
checkdepends=()
makedepends=('perl-extutils-parsexs>=0' 'perl-module-build>=0.2808_01' 'perl-extutils-cbuilder>=0' 'perl-test-nowarnings>=0.084' 'perl-test-simple>=0.62')
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/J/JA/JAWNSY/$_dist-$pkgver.tar.gz")
sha256sums=('9af790eb92d1c6330d33c6daa8decf8a9c5dcc87b81779d6b12e14b931c3b87b')

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
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install installdirs=vendor destdir="$pkgdir"
}
