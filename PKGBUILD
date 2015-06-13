# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-daemon-generic
pkgver=0.84
pkgrel="2"
pkgdesc="framework to provide start/stop/reload for a daemon"
arch=('any')
url="http://search.cpan.org/dist/Daemon-Generic"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-file-flock>=2013.06' 'perl-file-slurp')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MU/MUIR/modules/Daemon-Generic-$pkgver.tar.gz")
md5sums=('eeec05033baa9c59849c1053ad2f414e')
sha512sums=('eadf060653ec86b982f4388777b15bfcad55635042048d389ba7d88d2de5f778b849a2fabce3524f05e041fc76a51eae4af14e759659616b7d28fb4b657178e0')

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
