# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-io-event
pkgver=0.813
pkgrel="2"
pkgdesc="Tied Filehandles for Nonblocking IO with Object Callbacks"
arch=('any')
url="http://search.cpan.org/dist/IO-Event"
license=('GPL' 'PerlArtistic')
depends=('perl-list-moreutils')
makedepends=('perl-anyevent' 'perl-event')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MU/MUIR/modules/IO-Event-$pkgver.tar.gz")
md5sums=('a18be32ce73a2f5e7a1cf24dea86a035')
sha512sums=('234fe3037e9600b843b7db094b2bb67ff6d573d5a8cf48cec813d5cf6a996ae32bfde0eb35f8593c0cfe4d2d56a56882183e5fa291498df845a3c9fcb0ba7293')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/IO-Event-${pkgver}"
}

build() {
  prepare_environment
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
