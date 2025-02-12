# Maintainer: dringsim <dringsim@qq.com>
pkgname=perl-term-vt102
pkgver=0.91
pkgrel=1
pkgdesc='a class to emulate a DEC VT102 terminal'
_dist=Term-VT102
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/A/AJ/AJWOOD/$_dist-$pkgver.tar.gz")
sha256sums=('f954e0310941d45c0fc3eb4a40f5d3a00d68119e277d303a1e6af11ded6fbd94')

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
