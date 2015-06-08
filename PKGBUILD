# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-plugin-enablemiddleware'
_pkgname='Catalyst-Plugin-EnableMiddleware'
pkgver=0.006
pkgrel=3
pkgdesc='Enable Plack Middleware via Configuration'
arch=(i686 x86_64)
license=('perl')
url="http://search.cpan.org/dist/Catalyst-Plugin-EnableMiddleware/"
options=(!emptydirs)

depends=('perl>=5.10.1' 'perl-catalyst-runtime')
makedepends=('perl' 'perl-test-most')

provides=("catalyst-plugin-enablemiddleware=${pkgver}" "Catalyst::Plugin::EnableMiddleware=${pkgver}" "perl-catalyst-plugin-enablemiddleware=${pkgver}")

source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJNAPIORK/${_pkgname}-${pkgver}.tar.gz")
md5sums=('a172715297e50fd13d75b1acab5ea78c')
sha512sums=('71f96829ad90ddb28de30afd372b999da95fb4faf90b2d1ddf10b35c78e7a06c122311260160bc348287a3470c9f0c7151dc863949d53d42cab42ddc52a4dbd7')

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
