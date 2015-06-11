# Contributor: Eduardo Reveles <me at osiux dot ws>

pkgname=perl-net-frame
pkgver=1.15
pkgrel=1
pkgdesc="the base framework for frame crafting"
_dist=Net-Frame
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-bit-vector perl-class-gomor perl-net-ipv6addr perl-socket6)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/G/GO/GOMOR/$_dist-$pkgver.tar.gz")
md5sums=('927650f18121f369e1a167272b9efbda')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install installdirs=vendor destdir="$pkgdir"
)