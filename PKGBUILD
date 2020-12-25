# Maintainer: Jose Riha <jose1711 gmail com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-projectbuilder
pkgver=0.16.1
pkgrel=1
pkgdesc="module dealing with generic functions suitable for perl project development"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/release/ProjectBuilder'
source=("ftp://ftp.project-builder.org/src/project-builder-${pkgver}.tar.gz")
md5sums=('e1f185c99c2a37c0ffb66bf3edafb40d')
sha512sums=('a8df140f9d8c78ea16ce5a1209ca079585ecacf08c1b6c5b485881b5506bd2f6561c18615592052f05dbc3c22dd1aa052b3fb105a249d3d5587450479d74355b')
_distdir="ProjectBuilder-0.14.1"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      mandir=/usr/share/man \
      etcdir=/etc/pb \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL CONFDIR=/etc MANDIR=/usr/share/man
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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
