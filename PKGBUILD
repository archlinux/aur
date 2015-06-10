# Maintainer: Simon Perry <aur [at] sanxion [dot] net>

_perlmod=GnuPG-Interface
pkgname=perl-gnupg-interface
pkgver=0.52
pkgrel=1
pkgdesc="Object methods for interacting with GnuPG"
arch=('any')
url="http://search.cpan.org/dist/GnuPG-Interface"
license=('GPL' 'PerlArtistic')
groups=()
depends=('gnupg' 'perl-moox-late' 'perl-moox-handlesvia')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/$_perlmod-$pkgver.tar.gz")
sha256sums=('247a9f5a88bb6745281c00d0f7d5d94e8599a92396849fd9571356dda047fd35')
_distdir="$_perlmod-$pkgver"

build() {
  cd "$_distdir/test"
  gpg --list-keys --homedir . >/dev/null

  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

  ## For packages with Build.PL, do this instead:
  # perl Build.PL installdirs=vendor destdir="$pkgdir/"
  # perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  ## For packages with Build.PL, do this instead:
  # perl Build install
}

# vim:set ts=2 sw=2 et:
