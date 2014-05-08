# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-file-configdir
_cpanname=File-ConfigDir
pkgver=0.004
pkgrel=2
pkgdesc="Perl/CPAN File::ConfigDir - get directories of configuration files"
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('PerlArtistic')
depends=('perl-file-homedir')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/R/RE/REHSACK/$_cpanname-$pkgver.tar.gz")
md5sums=('95bbdc7222a12e5fc972a97b65c3e6eb')

build() {
  cd "$srcdir/$_cpanname-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check() {
  cd "$srcdir/$_cpanname-$pkgver"
  make test
}
package() {
  cd "$srcdir/$_cpanname-$pkgver"

  make DESTDIR="$pkgdir" install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name '*.pod' -o -name '.packlist' -delete
}
