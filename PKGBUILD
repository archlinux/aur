# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=R/RE/RENEEB
_perlmod=Padre-Plugin-RegexExplain
pkgname=perl-padre-plugin-regexexplain
pkgver=0.02
pkgrel=2
pkgdesc='Padre::Plugin::RegexExplain - A Padre plugin for Regex explainations'
arch=('any')
url="http://search.cpan.org/~reneeb/Padre-Plugin-RegexExplain"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-padre
perl-yape-regex-explain
)
makedepends=(
perl
)
options=(!emptydirs)
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

md5sums=('f7517ca0b8ea1d8d8544bff905c93f1c')
