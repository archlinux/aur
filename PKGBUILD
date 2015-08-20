# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-url-encode'
pkgver=0.03
pkgrel=1
pkgdesc='Encoding and decoding of application/x-www-form-urlencoded encoding.'
_dist='URL-Encode'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.8.1' 'perl-carp>=0' 'perl-exporter>=0' 'perl-xsloader>=0')
checkdepends=()
makedepends=('perl-test-simple>=0.88' 'perl-extutils-makemaker>=6.59')
provides=('perl-url-encode-pp=0.03')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/$_dist-$pkgver.tar.gz")
sha256sums=('7295d7f07796b179131d9c0f230a6effa56d204de2f8dc72f2e09c61458c8ee6')

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
