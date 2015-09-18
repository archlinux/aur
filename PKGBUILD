# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-sereal-decoder'
pkgver=3.005
pkgrel=1
pkgdesc='Fast, compact, powerful binary deserialization'
_dist='Sereal-Decoder'
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.8' 'perl-xsloader>=0')
checkdepends=('perl-pathtools>=0' 'perl-scalar-list-utils>=0' 'perl-test-warn>=0' 'perl-test-longstring>=0' 'perl-test-simple>=0.88' 'perl-data-dumper>=0')
makedepends=('perl-file-path>=0' 'perl-xsloader>=0' 'perl-extutils-parsexs>=2.21')
provides=("perl-sereal-performance=$pkgver")
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/$_dist-$pkgver.tar.gz")
sha256sums=('9de58131c6bf12f22366cf50b09c58ac3d2771489c202255a24fffab0bde0930')

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
