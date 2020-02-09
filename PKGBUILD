# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-object-signature'
_pkgname='Object-Signature'
pkgver='1.08'
pkgrel='1'
pkgdesc="Generate cryptographic signatures for objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.005')
makedepends=('perl-extutils-makemaker>=6.42')
url="http://search.cpan.org/dist/Object-Signature"
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('7c3c40ae04c976245ae84a5bb6afa72f5cb39ce0d9aa28b3af5cac1cb23c53e4246edd15056b9dcad9a03b54b053299bbbc03233437de5530ceb0a52de48a3ef')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
