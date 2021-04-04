# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

_author=A/AZ/AZAWAWI
_perlmod=Padre-Plugin-Snippet
pkgname=perl-padre-plugin-snippet
pkgver=0.01
pkgrel=3
pkgdesc='Padre::Plugin::Snippet - TextMate-like snippets for Padre'
arch=('any')
url='https://metacpan.org/release/Padre-Plugin-Snippet'
license=('GPL' 'PerlArtistic')
depends=(
perl-padre
perl-moose
perl-yaml
)
makedepends=(perl)
provides=(
perl-padre-plugin-snippet-document
perl-padre-plugin-snippet-fbp-preferences
perl-padre-plugin-snippet-preferences
perl-padre-plugin-snippet-role-needspluginevent
)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('3eddfdebbd475d12dc8d970abe874b95c1f7489749937e3a18ee9aca965354bd')

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

