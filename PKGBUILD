# Maintainer: Peter Pickford <arch#netremedies.ca>
# Contributor: Peter Pickford <arch#netremedies.ca>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=Y/YE/YENYA
_perlmod=Modem-Vgetty
_oldver=0.03
pkgname=perl-modem-vgetty
pkgver=0.04
pkgrel=1
pkgdesc='The Modem::Vgetty module is a Perl interface to the vgetty program, which can be used for communication with the voice modems.'
arch=('any')
url="http://search.cpan.org/~yenya/Modem-Vgetty"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl
)
makedepends=(
perl
)
optdepends=()
provides=(
perl-modem-vgetty
)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$_oldver.tar.gz"
'vocp-0.04.patch'
)
noextract=()

build(){
  cd "$srcdir/$_perlmod-$_oldver"
  patch -Np0 -i ../../vocp-0.04.patch || return 1

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check(){
  cd "$srcdir/$_perlmod-$_oldver"
  make test
}
package(){
  cd "$srcdir/$_perlmod-$_oldver"
  make install DESTDIR="$pkgdir/"
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
md5sums=('351bb0a027dc6dc9552ead80386e57d3'
         '58aa8ef45d6f4c926430494ae7146402')
