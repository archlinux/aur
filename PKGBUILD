# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-hash-persistent"
pkgver="1.02"
pkgrel='1'
pkgdesc='serializes its data to the single file using Data::Dumper, Storable or JSON'
arch=('any')
url="https://metacpan.org/pod/Hash::Persistent1"
license=('Artistic-2.0')
depends=("perl" "perl-json" "perl-lock-file")
options=("!emptydirs")
source=("https://cpan.metacpan.org/authors/id/M/MM/MMCLERIC/Hash-Persistent-${pkgver}.tar.gz")
sha256sums=('2d8cc937aea3373900cc80610c17f875fbdf712eba9089deffbe15644fe059cd')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Hash-Persistent-${pkgver}"
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
