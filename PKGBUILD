# Maintainer: Mark Grimes <mgrimes at peculier dot com>
# https://github.com/mvgrimes/aur-perl-math-calc-units

pkgname=perl-math-calc-units
pkgver=1.07
pkgrel=4
pkgdesc="Human-readable unit-aware calculator"
_dist=Math-Calc-Units
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=('!emptydirs' purge)
source=(https://cpan.metacpan.org/authors/id/S/SF/SFINK/$_dist-$pkgver.tar.gz)
md5sums=('56e4be0e64d6c8fc27c8f87d0d3cebd8')

# Setup environment to ensure installation in system perl and vender directory
clean_env() {
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null PERL_AUTOINSTALL=--skipdeps
}

build() (
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  clean_env
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
