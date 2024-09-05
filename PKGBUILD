# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-pdl-graphics-colorspace
_dist=PDL-Graphics-ColorSpace
pkgver=0.203
pkgrel=4
pkgdesc='Image color space conversions'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz")
sha256sums=('3115044e4eec228894ec1b46b9cda5e89af1f24bb41be453dae2b790216d0511')

arch=(i686 x86_64)
depends=(perl perl-pdl glibc)
checkdepends=(perl-test-simple)
options=('!emptydirs')

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
