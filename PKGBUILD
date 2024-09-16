# Maintainer: Flammkuchen <aur at bbirkner dot de>
# Contributor: xeruf <27jf at pm dot me>
_pkgname=Text-Layout
pkgname=perl-text-layout
pkgver=0.038
pkgrel=1
pkgdesc="Pango style markup formatting"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=()
url='https://metacpan.org/pod/Text::Layout'
source=("https://cpan.metacpan.org/authors/id/J/JV/JV/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('2da708bad4b39c6b66b2eec0857816901ba1f27e0a9201b58519e93b1934a3dd173dd9f6b1c5ec3e935a02387d5cdc14f9d79b499d316544df8776cb51be45e5')
_distdir="${_pkgname}-${pkgver}"

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
