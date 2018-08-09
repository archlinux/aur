# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Eduardo Reveles <me at osiux dot ws>

pkgname=perl-net-frame
pkgver=1.17
pkgrel=3
pkgdesc="the base framework for frame crafting"
_dist=Net-Frame
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
makedepends=('perl-module-build')
checkdepends=('perl-net-ipv4addr')
depends=(perl perl-bit-vector perl-class-gomor perl-net-ipv6addr perl-socket6)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/G/GO/GOMOR/$_dist-$pkgver.tar.gz")
md5sums=('9219f01c4ac55e6aba518529df9edb92')

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
  rm -fr "$pkgdir/usr/lib"
)
