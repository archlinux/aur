# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=D/DC/DCONWAY
_perlmod=Regexp-MatchContext
pkgname=perl-regexp-matchcontext
pkgver=0.0.2
pkgrel=2
pkgdesc='Regexp::MatchContext - replace (and improve) variables MATCH, PREMATCH, and POSTMATCH'
arch=('any')
url="http://search.cpan.org/~dconway/Regexp-MatchContext/"
license=('GPL' 'PerlArtistic')
groups=()
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
md5sums=('dded815903de6fe437a9e67d6048606e')
