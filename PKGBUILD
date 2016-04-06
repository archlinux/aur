# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-datetime-format-mysql
pkgver='0.06'
pkgrel='1'
pkgdesc="Parse and format MySQL dates and times"
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/~drolsky/DateTime-Format-MySQL"
options=(!emptydirs)
depends=('perl-datetime' 'perl-datetime-format-builder')
source=("https://cpan.metacpan.org/authors/id/X/XM/XMIKEW/DateTime-Format-MySQL-${pkgver}.tar.gz")
md5sums=('60b84516b5f29e0c639cd1a0f12333d2')
sha512sums=('56ea114f45e848f7a2389e1fea306b0e97d78e7033d745426db71bbfc527bb90affef8e2a697c213d855aced530b990424eedd92576354abcd4a3bbc3d6f1e69')

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
