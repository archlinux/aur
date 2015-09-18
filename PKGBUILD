# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-sereal'
pkgver=3.005
pkgrel=1
pkgdesc='Fast, compact, powerful binary (de-)serialization'
_dist='Sereal'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.8' 'perl-sereal-encoder>=3.005' 'perl-sereal-decoder>=3.005')
checkdepends=('perl-sereal-encoder>=3.005' 'perl-test-simple>=0.88' 'perl-sereal-decoder>=3.005')
makedepends=('perl-extutils-makemaker>=0')
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/Y/YV/YVES/$_dist-$pkgver.tar.gz")
sha256sums=('621e4f69ad70331d5041d45fc36f2602a3ed0551b89aa6c0c45df05d5820adbb')

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
