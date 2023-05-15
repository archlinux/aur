# Maintainer: John Regan <john@jrjrtech.com>
pkgname=perl-perlx-maybe-xs
pkgver=1.001
pkgrel=1
pkgdesc='Perl PerlX::Maybe::XS CPAN module'
_dist=PerlX-Maybe-XS
arch=('x86_64' 'i686')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/T/TO/TOBYINK/${_dist}-${pkgver}.tar.gz")
md5sums=('4cf8b5fdd8d7d4c7ed013a7b37963049')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

