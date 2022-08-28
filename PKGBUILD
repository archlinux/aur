# Contributor: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-pod-elemental-perlmunger'
pkgver=0.200006
pkgrel=1
pkgdesc='a thing that takes a string of Perl and rewrites its documentation'
_dist='Pod-Elemental-PerlMunger'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-encode' 'perl-pod-elemental' 'perl-moose' 'perl-ppi' 'perl-params-util' 'perl-list-allutils' 'perl-namespace-autoclean')
checkdepends=('perl-test-simple' 'perl-pod-elemental' 'perl-version' 'perl-moose' 'perl-pathtools' 'perl-extutils-makemaker' 'perl-scalar-list-utils')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('09fd3b5d53119437a01dced66b42eafdcd53895b3c32a2b0f781f36fda0f665b')

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
