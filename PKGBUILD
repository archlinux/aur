# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-types-xsd'
pkgver=0.008
pkgrel=1
pkgdesc='type constraints based on XML schema datatypes'
_dist='Types-XSD'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=(
    perl
    perl-types-xsd-lite
    perl-type-tiny
    perl-xml-regexp
    perl-datetimex-auto
    perl-datetime-incomplete
)
checkdepends=(
    perl-type-tiny
    perl-test-simple
)
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('e2b0913b927b3c26e8f9ee148ebbe6463ec6211f698fc7c9faf79091fe0c3e03')

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
