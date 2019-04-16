# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-file-zglob'
pkgver='0.11'
pkgrel='1'
pkgdesc='Extended globs for perl'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=()
url='https://metacpan.org/pod/File::Zglob'
source=('https://cpan.metacpan.org/authors/id/T/TO/TOKUHIROM/File-Zglob-0.11.tar.gz')
md5sums=('fca426b60326cb8465e54a1ed82dc8cf')
sha512sums=('19d0f40c4dd9ca46b92acb0ffc75dc357f21fae6f4b6927d107985d5427d0f5b7264f5052931377b27eab61a13eba404f2129dccabb4f5a140ee02c726b98701')
_distdir="File-Zglob-0.11"

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
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
