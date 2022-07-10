# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-devel-findperl'
pkgver=0.016
pkgrel=1
pkgdesc='Find the path to your perl'
_dist='Devel-FindPerl'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/L/LE/LEONT/$_dist-$pkgver.tar.gz")
sha256sums=('43a2bf2f787a3f1b881179063162b2aa3e7cb044f6e5e76ec6466ae90a861138')

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
