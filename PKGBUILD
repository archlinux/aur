# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-url-encode-xs'
pkgver=0.03
pkgrel=1
pkgdesc='XS implementation of URL::Encode'
_dist='URL-Encode-XS'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.8.1' 'perl-xsloader>=0' 'perl-url-encode>=0.03' 'perl-carp>=0' 'perl-exporter>=0')
checkdepends=()
makedepends=('perl-extutils-makemaker>=6.59' 'perl-test-simple>=0.88')
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/$_dist-$pkgver.tar.gz")
sha256sums=('d44f416bd3e58e3b3366ab420705da02c7118fc848a97ce089366ea0461fa823')

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
