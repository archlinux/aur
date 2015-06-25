# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-crypt-tea_pp'
pkgver=0.0308
pkgrel=1
pkgdesc='Pure Perl Implementation of the Tiny Encryption Algorithm'
_dist='Crypt-TEA_PP'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.10' 'perl-scalar-list-utils>=1.38' 'perl-carp>=1.3301' 'perl-scalar-util-numeric>=0.40')
checkdepends=('perl>=5.10')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/J/JA/JAHIY/$_dist-$pkgver.tar.gz")
sha256sums=('12b4d8760cec36b94963432b38556d0256a1097d7d585fc4c07cacecf423fced')

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
