# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-types-datetime'
pkgver=0.001
pkgrel=1
pkgdesc='type constraints and coercions for datetime objects'
_dist='Types-DateTime'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-module-runtime>=0' 'perl-datetime>=0' 'perl-type-tiny>=0.041' 'perl-datetime-locale>=0' 'perl-datetime-timezone>=0')
checkdepends=('perl-test-modern>=0')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('c4266a8df8850887929987caa30921ffaf53c99faf22fed4a5fe763aefe190a2')

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
