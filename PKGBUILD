# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-plugin-authentication'
_pkgname='Catalyst-Plugin-Authentication'
pkgver='0.10024'
pkgrel='2'
pkgdesc="Infrastructure plugin for the Catalyst authentication framework."
arch=('any')
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl' 'perl-catalyst-runtime' 'perl-mro-compat' 'perl-moose'
'perl-moosex-emulate-class-accessor-fast' 'perl-namespace-autoclean'
'perl-string-rewriteprefix' 'perl-try-tiny')
url="https://metacpan.org/release/Catalyst-Plugin-Authentication"
source=("https://cpan.metacpan.org/authors/id/J/JJ/JJNAPIORK/${_pkgname}-${pkgver}.tar.gz")
md5sums=('3d80bff1bcf16cb75575cf5e1458d3b0')
sha512sums=('882f3e2c1b6e6f3a896915dcd82ab67fad5816f1869ded03cfa63516ffb18e2bd1ca07f0a851c7c2270ce5bf2874c2aec6376b0a64ffe44c71fe08d762954e03')


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
