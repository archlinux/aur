# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-type-tiny-xs'
pkgver=0.012
pkgrel=1
pkgdesc="provides an XS boost for some of Type::Tiny's built-in type constraints"
_dist='Type-Tiny-XS'
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.10.1')
checkdepends=('perl-test-simple>=0.92')
makedepends=()
provides=("perl-type-tiny-xs-util=$pkgver")
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('a93ed33fd21646548ab5cdb0de647cc574ad3e41b414af7980526e8612cacb16')

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
