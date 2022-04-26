# Contributor: Nathaniel Clark <my full dot name at misrule dot us>

pkgname='perl-mojo-jwt'
pkgver='0.09'
pkgrel='1'
pkgdesc="JSON Web Token the Mojo way "
_distname='Mojo-JWT'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-sha' 'perl-mojolicious')
makedepends=('perl-module-build-tiny')
checkdepends=()
optdepends=('perl-crypt-openssl-bignum: RSA support'
	    'perl-crypt-openssl-rsa: RSA support')
url="https://metacpan.org/dist/$_distname"
source=("https://cpan.metacpan.org/authors/id/J/JB/JBERGER/$_distname-$pkgver.tar.gz")
md5sums=('793d9ab5471dbac21fa059456c29dee8')
sha512sums=('9da5af40186ad305d186ea834f90bb7ee3677b46d0ee9490a46b9f9671ce3a6536879c235852532ef83c31063c2c539ebd845dc37b794e13e3682d21cd985607')
_distdir="$_distname-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    ./Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    ./Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  ./Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
