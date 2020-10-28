# Contributor: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname=perl-lazy-utils
pkgver=1.22
pkgrel=1
pkgdesc="ORKUN's collection of utility functions Lazy::Util"
_dist=Lazy-Utils
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL3')
depends=(perl perl-json)
options=('!emptydirs' purge)
source=("https://search.cpan.org/CPAN/authors/id/O/OR/ORKUN/$_dist-$pkgver.tar.gz")
sha256sums=('73aec71fc292a9f606d700192820935bb11177725516e93904652b3a4b78ee91')

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

