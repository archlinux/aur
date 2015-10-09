# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-function-parameters'
pkgver=1.0605
pkgrel=1
pkgdesc='subroutine definitions with parameter lists'
_dist='Function-Parameters'
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.14' 'perl-xsloader>=0' 'perl-carp>=0')
checkdepends=('perl-dir-self>=0' 'perl-constant>=0' 'perl-test-fatal>=0' 'perl-test-simple>=0')
makedepends=()
provides=("perl-function-parameters-info=$pkgver" "perl-function-parameters-param=$pkgver")
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MAUKE/$_dist-$pkgver.tar.gz")
sha256sums=('0ffbf6b19c7c3c51eaa322aec67cf35a5b69fd0f51ba80ed419810907b018d7f')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
