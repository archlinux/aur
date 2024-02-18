# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-datetimex-auto'
pkgver=0.009
pkgrel=1
pkgdesc='use DateTime without needing to call constructors'
_dist='DateTimeX-Auto'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-universal-ref>=0' 'perl-exporter-tiny>=0' 'perl-datetime-format-strptime>=0' 'perl-datetime>=0')
checkdepends=('perl-test-simple>=0.61')
makedepends=()
provides=("perl-datetimex-auto-duration=$pkgver" "perl-datetimex-auto-datetime=$pkgver" "perl-datetimex-auto-duration=$pkgver" "perl-datetimex-auto-datetime=$pkgver" "perl-datetimex-auto-duration=$pkgver" "perl-datetimex-auto-datetime=$pkgver")
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('d21720bab08573f57651c597760b21f2388b15e654b8a2ed18d6a07c89cfdbdc')

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
