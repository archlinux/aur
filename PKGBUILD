# Maintainer: dringsim <dringsim@qq.com>
pkgname=perl-html-fromansi
pkgver=2.03
pkgrel=1
pkgdesc='Mark up ANSI sequences as HTML'
_dist=HTML-FromANSI
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-html-parser' 'perl-term-vt102-boundless')
checkdepends=('perl-test-simple')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/N/NU/NUFFIN/$_dist-$pkgver.tar.gz")
sha256sums=('21776345ed701b2c04c7b09380af943f9984cc7f99624087aea45db5fc09c359')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
