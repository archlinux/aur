# CPAN Name  : HTML::Lint
# Contributor: Ordoban <dirk.langer@vvovgonik.de>

pkgname=perl-html-lint
_pkgname='HTML-Lint'
pkgver=2.26
pkgrel=1
pkgdesc="Perl module to check for HTML errors in a string or file"
arch=("any")
url="http://search.cpan.org/dist/HTML-Lint"
license=("PerlArtistic")
depends=("perl>=5.6.2" "perl-html-parser>=3.47" "perl-html-tagset>=3.03")
source=(http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=("c95174ce17a92163d67ab6a503196f91")
sha512sum=("feee90fcb070786f28c3ee17ad2222156c4f89660d40f9392f78033e31c28842ff84bdd49a31a890ac9796e781a3d5eead80502be237e305f8b34ffcf75371")

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make test
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
