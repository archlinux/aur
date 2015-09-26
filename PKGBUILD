# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-datetime-incomplete'
pkgver=0.07
pkgrel=1
pkgdesc='Incomplete DateTime objects'
_dist='DateTime-Incomplete'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-datetime-event-recurrence>=0' 'perl-datetime-set>=0.1401' 'perl-datetime>=0' 'perl-test-simple>=0')
checkdepends=()
makedepends=('perl-extutils-makemaker>=0')
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/F/FG/FGLOCK/$_dist-$pkgver.tar.gz")
sha256sums=('086a2442801637abc01e431ef5cdf13b022e7c9b04ab85bba7fc49266fe645c5')

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
