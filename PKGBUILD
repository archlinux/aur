# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: AUR Perl <aurperl@juster.info>

pkgname=perl-extutils-cbuilder
_realname=ExtUtils-CBuilder
pkgver=0.280216
pkgrel='1'
pkgdesc="CPAN/ExtUtils::CBuilder - Compile and link C code for Perl modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url="http://metacpan.org/release/$_realname"
source=("http://cpan.metacpan.org/authors/id/A/AM/AMBS/ExtUtils/${_realname}-${pkgver}.tar.gz")
md5sums=('e213485bc24bf8fb3db35847977d07bd')

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
