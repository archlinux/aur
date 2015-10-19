# Contributor: maz-1 < ohmygod19993 at gmail dot com >

pkgname='perl-qtcore4'
pkgver='0.99.0'
pkgrel='1'
pkgdesc="Perl bindings for the QtCore version 4 library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('qt4' 'perl>=5.8.0')
makedepends=('qimageblitz' 'qwt5')
optdepends=('qimageblitz' 'qwt5')
url='http://search.cpan.org/~cburel/Qt4-0.99.0/qtcore/lib/QtCore4.pm'
source=('http://search.cpan.org/CPAN/authors/id/C/CB/CBUREL/Qt4-0.99.0.tar.bz2')
md5sums=('5ee2a06d61ea7725e76571807d324f0a')
_distdir="Qt4-0.99.0"

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
