# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-gtk3'
pkgver='0.026'
pkgrel='1'
pkgdesc="Perl interface to the 3.x series of the gtk+ toolkit"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gtk3' 'perl-cairo-gobject>=1.000' 'perl-glib-object-introspection>=0.016')
makedepends=()
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
url='https://metacpan.org/release/Gtk3'
source=('http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Gtk3-0.026.tar.gz')
md5sums=('d0de8124000200abeaf753407967a324')
sha512sums=('b1b11845cdc2834c68ead133dbc40246e8d43129e191ab2b91c48226e0aede139b81e34e8080eb72802cbc1e1a31d266bd13c07412dc1ab71505a730f09a9e3b')
_distdir="Gtk3-0.026"

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
    xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make test
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
