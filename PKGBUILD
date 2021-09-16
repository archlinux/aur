# maintainer: xeruf <27f at pm dot me>
pkgname=perl-text-layout
pkgver=0.021
pkgrel=1
pkgdesc="Pango style markup formatting"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=()
url='https://metacpan.org/pod/Text::Layout'
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/Text-Layout-${pkgver}.tar.gz")
sha512sums=('5dd7fba13f234487c2525673bbc4626fe38f686580f29635063ee3f73faebc40c964de219c8dffa821ab4475b002fe18519671a838c9a2f14e86f99b88c89fc7')
_distdir="Text-Layout-${pkgver}"

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
