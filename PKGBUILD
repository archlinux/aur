# Maintainer: dringsim <dringsim@qq.com>
pkgname=perl-term-vt102-boundless
pkgver=0.05
pkgrel=1
pkgdesc='A Term::VT102 that grows automatically to accomodate whatever you print to it.'
_dist=Term-VT102-Boundless
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-term-vt102')
checkdepends=('perl-test-simple')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/F/FB/FBARRIOS/$_dist-$pkgver.tar.gz")
sha256sums=('e1ded85ae3d76b59c03b8697f4a6cb01ae31bd62a9354f5bb7d18f9e927b485f')

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
