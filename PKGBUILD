# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-dir-self'
pkgver=0.11
pkgrel=1
pkgdesc='a __DIR__ constant for the directory your source file is in'
_dist='Dir-Self'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-pathtools>=0' 'perl-carp>=0')
checkdepends=('perl-test-simple>=0' 'perl-lib>=0')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MAUKE/$_dist-$pkgver.tar.gz")
sha256sums=('e251a51abc7d9ba3e708f73c2aa208e09d47a0c528d6254710fa78cc8d6885b5')

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
