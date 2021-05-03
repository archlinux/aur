_author=P/PD/PDEEGAN
_perlmod=XML-Mini
pkgname=perl-xml-mini
pkgver=1.38
pkgrel=4
pkgdesc='XML::Mini - Perl implementation of the XML::Mini XML create/parse interface'
arch=('any')
url='https://metacpan.org/release/XML-Mini'
license=('GPL' 'PerlArtistic')
provides=(
perl-xml-mini-document
perl-xml-mini-element
perl-xml-mini-element-cdata
perl-xml-mini-element-comment
perl-xml-mini-element-doctype
perl-xml-mini-element-entity
perl-xml-mini-element-header
perl-xml-mini-node
perl-xml-mini-treecomponent
)
depends=(perl)
makedepends=(perl)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('af803d38036a3184e124a682e5466f1bc107f48a89ef35b0c7647e11a073fe2d')

build(){
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
