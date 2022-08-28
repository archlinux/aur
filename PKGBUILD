# Contributor: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-type-tiny-xs'
pkgver=0.022
pkgrel=1
pkgdesc="provides an XS boost for some of Type::Tiny's built-in type constraints"
_dist='Type-Tiny-XS'
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl')
checkdepends=('perl-type-tiny')
provides=("perl-type-tiny-xs-util=$pkgver")
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('bcc34a31f7dc1d30cc803889b5c8f90e4773b73b5becbdb3860f5abe7e22ff00')

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
