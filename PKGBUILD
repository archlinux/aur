# Maintainer: Ordoban <dirk.langer@vvovgonik.de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-gtk3'
pkgver='0.032'
pkgrel='1'
pkgdesc="Perl interface to the 3.x series of the gtk+ toolkit"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gtk3' 'perl-cairo-gobject>=1.000' 'perl-glib-object-introspection>=0.016')
makedepends=()
checkdepends=('ttf-dejavu' 'xorg-server-xvfb')
url='https://metacpan.org/release/Gtk3'
source=('http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Gtk3-0.032.tar.gz')
md5sums=('83e2ab9cbce1116b99d5af9075be315e')
sha512sums=('eb02fd872f7fe6e34c230424cf2e0ec29275c0bb2332fba1e61222c421d6eae33781c4ace6cb5fe9c5246986b1df376eea2dc2904880fe30a29023cd22e38aa2')
_distdir="Gtk3-0.032"

build() {
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" make test
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
