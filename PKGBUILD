# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-types-xsd-lite'
pkgver=0.007
pkgrel=1
pkgdesc='type constraints based on a subset of XML schema datatypes'
_dist='Types-XSD-Lite'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-type-tiny>=0.004')
checkdepends=(
    perl-moo
    perl-test-fatal
    perl-test-requires
    perl-test-simple
    perl-type-tiny
)
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('8c396c4e9d9665b740d12f384903b54c8de13d8b7280257f3ec23c5db16540ad')

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
