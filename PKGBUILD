# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=B/BB/BBC
_perlmod=Pod-Xhtml
pkgname=perl-pod-xhtml
pkgver=1.61
pkgrel=3
pkgdesc='Pod::Xhtml - Generate well-formed XHTML documents from POD format documentation'
arch=('any')
url="http://search.cpan.org/~bbc/Pod-Xhtml/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-test-assertions
perl-uri
)
makedepends=(
perl
)
optdepends=()
provides=(
perl-pod-hyperlink-bounceurl
)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
noextract=()

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
md5sums=('51e17843d0c91592ed10d21dec5ed60f')
