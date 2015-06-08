# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-plugin-session-store-fastmmap'
_pkgname='Catalyst-Plugin-Session-Store-FastMmap'
pkgver='0.16'
pkgrel='2'
pkgdesc="FastMmap session storage backend."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-cache-fastmmap>=1.29' 'perl-catalyst-runtime>=5.8' 'perl-catalyst-plugin-session' 'perl-mro-compat' 'perl-moosex-emulate-class-accessor-fast' 'perl-path-class')
makedepends=('perl-extutils-makemaker')
url="http://search.cpan.org/dist/Catalyst-Plugin-Session-Store-FastMmap"
source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/${_pkgname}-${pkgver}.tar.gz")
md5sums=('4e7f7b255c9aeceb627e45d2b8d814f9')
sha512sums=('097bc6a233d66e2abef0d24c29f0ee91d0c5cdfbb8a31827aaec19708eb7f09675bc77616a6ac76e8ac0a87b549d93d78dbea6a593455af7a2f36c0cf62ae673')

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
