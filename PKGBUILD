# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: chimeracoder <dev@chimeracoder.net>

pkgname=perl-file-homedir
_cpanname=File-HomeDir
pkgver=1.004
pkgrel=1
pkgdesc="Find your home and other directories on any platform"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-which')
makedepends=('perl-module-install')
url="https://metacpan.org/release/$_cpanname"
source=("https://cpan.metacpan.org/authors/id/R/RE/REHSACK/$_cpanname-$pkgver.tar.gz")
md5sums=('2db6a961960baec790a896b99b46395d')

build() {
  cd $_cpanname-$pkgver

  # why isn't makepkg doing this?
  export -n PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 \
  PERL_AUTOINSTALL='--skipdeps' \
  perl Makefile.PL INSTALLDIRS=vendor
  make INSTALLDIRS=vendor
}
check() {
  cd $_cpanname-$pkgver
  make test
}
package() {
  cd $_cpanname-$pkgver

  make INSTALLDIRS=vendor DESTDIR="$pkgdir" install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name '*.pod' -o -name '.packlist' -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
