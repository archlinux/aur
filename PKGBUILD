# Contributor: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-dist-zilla-plugin-ourpkgversion'
pkgver=0.21
pkgrel=1
pkgdesc='no line insertion and does Package version with our'
_dist='Dist-Zilla-Plugin-OurPkgVersion'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-ppi' 'perl-moose' 'perl-dist-zilla' 'perl-moosex-types-perl' 'perl-namespace-autoclean')
checkdepends=('perl-pathtools' 'perl-test-version' 'perl-io' 'perl-dist-zilla' 'perl-test-simple')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/$_dist-$pkgver.tar.gz")
sha256sums=('76e3861f03f0ad87432089530349478f33dd07b56df650f8b971153c2e42d021')

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
