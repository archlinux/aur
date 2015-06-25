# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-dist-zilla-plugin-minimumperl'
pkgver=1.006
pkgrel=1
pkgdesc='Detects the minimum version of Perl required for your dist'
_dist='Dist-Zilla-Plugin-MinimumPerl'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.6' 'perl-perl-minimumversion>=1.26' 'perl-moosex-types-perl>=0.101340' 'perl-dist-zilla>=5.006' 'perl-moose>=1.03')
checkdepends=('perl>=5.6' 'perl-file-temp>=0' 'perl-test-simple>=0.88' 'perl-pathtools>=0' 'perl-io>=0')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/A/AP/APOCAL/$_dist-$pkgver.tar.gz")
sha256sums=('52646bf65f5fd5ce0b1fa64b318946151bb9a5a05525eb27e74e6c99a4254e34')

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
