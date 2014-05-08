# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: AUR Perl <aurperl@juster.info>

pkgname=perl-extutils-cbuilder
_realname=ExtUtils-CBuilder
pkgver=0.280205
pkgrel='1'
pkgdesc="CPAN/ExtUtils::CBuilder - Compile and link C code for Perl modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url="http://metacpan.org/release/$_realname"
source=("http://cpan.metacpan.org/authors/id/D/DA/DAGOLDEN/${_realname}-${pkgver}.tar.gz")
md5sums=('90253d00a71f53ca9bf82cf50467e240')

build() {
  cd "$srcdir/$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_realname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
