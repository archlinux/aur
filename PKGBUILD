# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-daemon-generic"
pkgver="0.85"
pkgrel='5'
pkgdesc="framework to provide start/stop/reload for a daemon"
arch=('any')
url="https://metacpan.org/dist/Daemon-Generic"
license=('Artistic-2.0')
depends=('perl-file-flock>=2013.06' 'perl-file-slurp')
makedepends=('perl-anyevent' 'perl-eval-linenumbers' 'perl-event')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MU/MUIR/modules/Daemon-Generic-${pkgver}.tar.gz")
sha512sums=('fe23e58d08013f9b10fd741f40636b44e20e7e8278be6ee6f6eecae59f18810c5d485e85fe56ded0ef23c3318b5a994f6821829a9966398a54b70859d827b9c4')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Daemon-Generic-${pkgver}"
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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
