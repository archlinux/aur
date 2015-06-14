# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 29/11/2011

_author=D/DC/DCONWAY
_perlmod=Perl6-Export
pkgname=perl-perl6-export
pkgver=0.07
pkgrel=2
pkgdesc="Perl6::Export - Implements the Perl 6 'is export(...)' trait "
arch=('any')
url="http://search.cpan.org/~dconway/Perl6-Export/"
license=('GPL' 'PerlArtistic')
groups=('perl6')
depends=('perl')
makedepends=('perl')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")

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

md5sums=('cd44b18fd589cee60aca6cfbe58f9c2e')
