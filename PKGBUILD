# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-dist-zilla-plugin-ourpkgversion'
pkgver=0.06
pkgrel=1
pkgdesc='no line insertion and does Package version with our'
_dist='Dist-Zilla-Plugin-OurPkgVersion'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.8' 'perl-ppi>=0' 'perl-moose>=0' 'perl-dist-zilla>=0' 'perl-moosex-types-perl>=0' 'perl-namespace-autoclean>=0')
checkdepends=('perl-pathtools>=0' 'perl-test-version>=0.04' 'perl-io>=0' 'perl-dist-zilla>=0' 'perl-test-simple>=0.88')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/P/PL/PLICEASE/$_dist-$pkgver.tar.gz")
sha256sums=('5bc7e14aa2898f81240923baef849104e696c3b45ae0a69b95d091bf562c8e15')

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
