# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-catalyst-plugin-stacktrace'
_pkgname='Catalyst-Plugin-StackTrace'
pkgver='0.12'
pkgrel='2'
pkgdesc="Catalyst::Plugin::StackTrace - Display a stack trace on the debug screen"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-catalyst-runtime>=5.80008' 'perl-devel-stacktrace' 'perl-namespace-autoclean'
)
makedepends=('')
url='http://search.cpan.org/dist/Catalyst-Plugin-StackTrace'
source=("http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/${_pkgname}-${pkgver}.tar.gz")
md5sums=('f089320a66b085f6ee087c990bdccf6c')
sha512sums=('881dbb2670c39bf98f3a771074be9581cc2bd792a60da82529e165172a958d6a4e1158773c53e54b59ed57499ff8b26a141961e27825a21593ca3b455849817a')

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
