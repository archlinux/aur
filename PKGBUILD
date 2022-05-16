# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-datetime-format-mysql
pkgver='0.0701'
pkgrel='1'
pkgdesc="Parse and format MySQL dates and times"
arch=("any")
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~drolsky/DateTime-Format-MySQL"
options=(!emptydirs)
depends=('perl-datetime' 'perl-datetime-format-builder')
makedepends=('perl-module-build')
source=("https://cpan.metacpan.org/authors/id/X/XM/XMIKEW/DateTime-Format-MySQL-${pkgver}.tar.gz")
md5sums=('3e53451637536ee14811396bfbf08caa')
sha512sums=('74cbe1dcf6d708c643b24eb25f837f56715fee6685a1071bce9e5e5114347155018b8c14247233910bd6e6208996532962b93cc024a816fbeb37a41116a6265c')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/DateTime-Format-MySQL-${pkgver}"
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
