# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-devel-findperl'
pkgver=0.014
pkgrel=1
pkgdesc='Find the path to your perl'
_dist='Devel-FindPerl'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.6' 'perl-scalar-list-utils>=0' 'perl-exporter>=5.57' 'perl-pathtools>=0' 'perl-carp>=0')
checkdepends=('perl-io>=0' 'perl-test-simple>=0' 'perl-pathtools>=0')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/$_dist-$pkgver.tar.gz")
sha256sums=('01959448f4bfdc6fedbda1e80db810ad6e31b667a171d782031ae5fa742b495b')

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
