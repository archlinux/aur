pkgname='perl-desktop-notify'
pkgver='0.05'
pkgrel='1'
pkgdesc="Communicate with the Desktop Notifications framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-net-dbus')
url='https://metacpan.org/pod/Desktop::Notify'
source=('https://cpan.metacpan.org/authors/id/S/SA/SACAVILIA/Desktop-Notify-0.05.tar.gz')
sha256sums=('5ec52aa13387a6819402554b74997830954aa5e908a711eb8bb19dd3334b101d')
_distdir="Desktop-Notify-0.05"

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
