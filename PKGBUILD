# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=perl-ole-storage-lite
_pkgname='OLE-Storage_Lite'
pkgver=0.20
pkgrel=1
pkgdesc="Simple Class for OLE document interface"
arch=('any')
url="http://search.cpan.org/dist/OLE-Storage_Lite/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/${_pkgname}-$pkgver.tar.gz")
sha256sums=('ab18a6171c0e08ea934eea14a0ab4f3a8909975dda9da42124922eb41e84f8ba')

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
