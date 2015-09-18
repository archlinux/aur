# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-sereal-encoder'
pkgver=3.005
pkgrel=1
pkgdesc='Fast, compact, powerful binary serialization'
_dist='Sereal-Encoder'
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.8' 'perl-xsloader>=0')
checkdepends=('perl-test-longstring>=0' 'perl-pathtools>=0' 'perl-test-warn>=0' 'perl-test-simple>=0.88' 'perl-scalar-list-utils>=0' 'perl-data-dumper>=0' 'perl-sereal-decoder>=3.00')
makedepends=('perl-extutils-parsexs>=2.21' 'perl-file-path>=0')
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/$_dist-$pkgver.tar.gz")
sha256sums=('4dac10c61e9ca8901b2a000a6d749a22b0ca0c0c262e07007201811e6b15da48')

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
