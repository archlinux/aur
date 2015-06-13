# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-file-flock
pkgver='2014.01'
pkgrel='1'
pkgdesc="file locking with flock"
arch=('any')
url="http://search.cpan.org/dist/File-Flock"
license=('GPL' 'PerlArtistic')
depends=('perl-anyevent' 'perl-data-structure-util' 'perl-io-event>=0.812')
makedepends=('perl-file-slurp' 'perl-test-sharedfork')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MU/MUIR/modules/File-Flock-${pkgver}.tar.gz")
md5sums=('12a3342c96c5e42f1b7c7ec737327199')
sha512sums=('3892d9c126c809709e690391396bc349b95b790b2d1be34bf1d24d728dbbe8b9e5dc7a35f5bf17b420b5912aa6b1e2ef1aa6c6b60b48c4e17685eade7b3fae16')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/File-Flock-${pkgver}"
}

build() {
  prepare_environment
  # Fix bad file permissions in the tar ball
  chmod -R u+rw .

  # Build normally
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
