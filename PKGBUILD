# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=mime-construct
pkgver="1.11"
pkgrel="1"
pkgdesc="construct and optionally mail MIME messages"
arch=('any')
url="http://www.argon.org/~roderick/"
license=('GPL')
depends=('perl' 'perl-email-date-format' 'perl-mime-types' 'perl-proc-waitstat')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/mime-construct-${pkgver}.tar.gz"
        "include-date-header.diff")
sha512sums=('1192c5a0cd1c7675aaf4d1570c910672d3c3b6585f33e4781de289e8e1d9530c17b6d48083ad68349b46faa8e03be1dfeef16701b12763adc36bfa4f3b399a5f'
            '5efde6528bb2e9430c65e4eab7c8d0d4d23e4de03fb220a9a5e6c6dc1fd2a709902b456fbc2bee3eeae8230bc53d8e25d7ec0b3d1b5e0e0c80680e4cb9b919c8')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/mime-construct-${pkgver}"
}

build() {
  prepare_environment
  patch -p1 < "${srcdir}/include-date-header.diff"
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
