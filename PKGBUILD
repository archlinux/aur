# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-pod-elemental-perlmunger'
pkgver=0.200002
pkgrel=1
pkgdesc='a thing that takes a string of Perl and rewrites its documentation'
_dist='Pod-Elemental-PerlMunger'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-encode>=0' 'perl-pod-elemental>=0.103000' 'perl-moose>=0' 'perl-ppi>=0' 'perl-params-util>=0' 'perl-list-allutils>=0' 'perl-namespace-autoclean>=0')
checkdepends=('perl-test-simple>=0.96' 'perl-pod-elemental>=0.103000' 'perl-version>=0' 'perl-moose>=0' 'perl-pathtools>=0' 'perl-extutils-makemaker>=0' 'perl-scalar-list-utils>=0')
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('10d4adaaf293574907f1317e4b6cf992a520dee0bdcbd4d25137f96cbc80d3d4')

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
