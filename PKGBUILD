pkgname='perl-gtk3-notify'
pkgver='0.03'
pkgrel='1'
pkgdesc="Perl GTK3 interface to libnotify"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-gtk3' 'perl-glib-object-introspection')
url='https://metacpan.org/pod/Gtk3::Notify'
source=('https://cpan.metacpan.org/authors/id/T/TV/TVIGNAUD/Gtk3-Notify-0.03.tar.gz')
sha256sums=('0f06bb3a1a6ee1f1d2111b5e467a5ee27c60c3ab23f5a9e1e51e3a08773ed326')
_distdir="Gtk3-Notify-0.03"

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
