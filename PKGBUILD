# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-apache2-soap'
pkgver='0.73'
pkgrel='1'
pkgdesc="mod_perl-2 SOAP server"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-soap-lite' 'mod_perl')
makedepends=()
url='https://metacpan.org/release/Apache2-SOAP'
source=('http://search.cpan.org/CPAN/authors/id/R/RK/RKOBES/Apache2-SOAP-0.73.tar.gz')
md5sums=('e0c376abd24b9b494d0ee60b8eeecefb')
sha512sums=('0aeeee4deab4b1e5555e6321f3e2c2ffeaa542717237f6ad62a4581d9ced6b4047d8c2bff480ac5ce6df6717bc6bdf9d95e97a8ef75b9cbc869047bc4c28ea19')
_distdir="Apache2-SOAP-0.73"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

#Tests fail if Apache is not configured

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test || return 0
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
