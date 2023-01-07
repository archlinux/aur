# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-mime-encwords'
pkgver='1.014.3'
pkgrel='1'
pkgdesc="deal with RFC 2047 encoded words (improved)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mime-charset>=1.010.1' 'perl>=5.005')
makedepends=()
url='https://metacpan.org/pod/MIME::EncWords'
source=("https://cpan.metacpan.org/authors/id/N/NE/NEZUMI/MIME-EncWords-${pkgver}.tar.gz")
sha512sums=('77deed0b9b61101ba67f4d498213af9dc1078738fb0992661aa1b260ef394b84341173e5319579c4651f9b6271be0f80d4e96455c7caa9f81accb3db16601af8')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/MIME-EncWords-${pkgver}"
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
