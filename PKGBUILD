# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=A/AZ/AZAWAWI
_perlmod=Padre-Plugin-Snippet
pkgname=perl-padre-plugin-snippet
pkgver=0.01
pkgrel=2
pkgdesc='Padre::Plugin::Snippet - TextMate-like snippets for Padre'
arch=('any')
url="http://search.cpan.org/~azawawi/Padre-Plugin-Snippet"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-padre
perl-moose
perl-yaml
)
makedepends=(perl)
optdepends=()
provides=(
perl-padre-plugin-snippet-document
perl-padre-plugin-snippet-fbp-preferences
perl-padre-plugin-snippet-preferences
perl-padre-plugin-snippet-role-needspluginevent
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

md5sums=('669586128880f7b71fedf82e37be6071')
