# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=perl-ole-storage-lite
_pkgname='OLE-Storage_Lite'
pkgver=0.22
pkgrel=1
pkgdesc="Simple class for the OLE document interface"
arch=('any')
url="https://search.cpan.org/dist/${_pkgname}/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("https://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/${_pkgname}-$pkgver.tar.gz")
sha256sums=('d0566d6c29d397ea736379dc515c36849f6b97107cf700ba8250505c984cf965')

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
  find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
