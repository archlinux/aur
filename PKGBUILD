# Contributor: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname=perl-app-virtualenv
pkgver=2.07
pkgrel=1
pkgdesc='App::Virtualenv is a Perl package to create isolated Perl virtual environments, like Python virtual environment.'
_dist=App-Virtualenv
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL3')
depends=(perl perl-local-lib perl-lazy-utils)
options=('!emptydirs' purge)
source=("https://search.cpan.org/CPAN/authors/id/O/OR/ORKUN/$_dist-$pkgver.tar.gz")
sha256sums=('bb13a1aea1c395f4c1146aaa9e1b9c131ba92256cc8a033c228ad09e370f9730')


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

