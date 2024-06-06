# Maintainer: Elias Elwyn <a@jthv.ai>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-pgplot
pkgver=2.29
pkgrel=3
pkgdesc='PGPLOT module for Perl'
_dist=PGPLOT
arch=(i686 x86_64)
url="https://metacpan.org/release/$_dist"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=(perl pgplot)
makedepends=(perl-devel-checklib perl-extutils-f77)
source=("https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz")
options=('!emptydirs')
sha256sums=(a23107bca507658b0960e0099ff0d7e90dbb75b878895a4d18b0d4777194ca9f)

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
