# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-plugin-unicode-encoding'
_pkgname='Catalyst-Plugin-Unicode-Encoding'
pkgver='1.9'
pkgrel='2'
pkgdesc='Catalyst::Plugin::Unicode::Encoding - Unicode aware Catalyst'
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
url='http://search.cpan.org/dist/Catalyst-Plugin-Unicode-Encoding'
options=('!emptydirs')

depends=('perl' 'perl-catalyst-runtime>=5.80' 'perl-io-stringy' 'perl-libwww>=5.828' 'perl-uri>=1.36' 'perl-mro-compat' 'perl-class-data-inheritable')
makedepends=('perl')

provides=('catalyst-plugin-unicode-encoding=1.9' 'Catalyst::Plugin::Unicode::Encoding=1.9' 'perl-catalyst-plugin-unicode-encoding=1.9')

source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/${_pkgname}-${pkgver}.tar.gz")
md5sums=('cb246b577b5032bb475e1770e98cbefa')
sha512sums=('80b4aa3ab96dd05b9bea0007cba37c22614a5768d63418be07769634ca67d3ae2ecd1602668f1eb39b91405aaba0e8f35594a6cc071a859602ecede46318779d')

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

# vim:set ts=2 sw=2 et:
