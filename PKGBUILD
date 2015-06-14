# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 29/11/2011

_author=D/DC/DCONWAY
_perlmod=Perl6-Form
pkgname='perl-perl6-form'
pkgver='0.04'
pkgrel='2'
pkgdesc="Perl6::Form - Implements the Perl 6 'form' built-in"
arch=('any')
url='http://search.cpan.org/~dconway/Perl6-Form'
license=('GPL' 'PerlArtistic')
groups=('perl6')
depends=('perl-perl6-export')
makedepends=('perl')
options=('!emptydirs')
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

md5sums=('e3109dc701d99ed81f4d39a2605ac86a')
