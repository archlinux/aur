# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-test-modern'
pkgver=0.013
pkgrel=1
pkgdesc='precision testing for modern perl'
_dist='Test-Modern'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>5.6.1' 'perl-test-warnings>=0.009' 'perl-test-api>=0.004' 'perl-try-tiny>=0.15' 'perl-test-deep>=0.111' 'perl-exporter-tiny>=0.030' 'perl-import-into>=1.002000' 'perl-test-simple>=0.96' 'perl-test-fatal>=0.007' 'perl-module-runtime>=0.012')
checkdepends=()
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/$_dist-$pkgver.tar.gz")
sha256sums=('63ebc04b761c5748a121006d0e2672a6836d39cfb9e0b42dda80c8161f7a1246')

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
