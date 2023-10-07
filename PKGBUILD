# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-jenkins-api'
pkgver='0.18'
pkgrel='1'
pkgdesc="A wrapper around the Jenkins API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-sharedir' 'perl-json' 'perl-moo' 'perl-rest-client' 'perl-type-tiny')
#makedepends=()
checkdepends=('perl-test2-suite' 'perl-test2-tools-explain')
url='https://metacpan.org/dist/Jenkins-API'
source=('https://cpan.metacpan.org/authors/id/N/NE/NEWELLC/Jenkins-API-0.18.tar.gz')
md5sums=('29dd2d9de5a4cee3aee16592b06db018')
_distdir="Jenkins-API-0.18"

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

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
