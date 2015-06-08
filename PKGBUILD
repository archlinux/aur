# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-moosex-daemonize'
_pkgname='MooseX-Daemonize'
pkgver='0.18'
pkgrel='1'
pkgdesc="Role for daemonizing your Moose based application"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.33' 'perl-moosex-getopt>=0.07' 'perl-moosex-types-path-class')
makedepends=('perl-extutils-makemaker>=6.36')
url="http://search.cpan.org/dist/MooseX-Daemonize"
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/${_pkgname}-${pkgver}.tar.gz")
md5sums=('4fc8cbe0a2d43ec99726fb94a31c2112')
sha512sums=('27b0debc7a74ab4b49191ca3844753bf43df4a1db6c195242d3b3772b0675c8424df980c15e2dff8ed605cc459c4343be232a3e57c549990b7c8c7fccf6fe737')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
