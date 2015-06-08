# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=perl-ole-storage-lite
_pkgname='OLE-Storage_Lite'
pkgver=0.19
pkgrel=2
pkgdesc="Simple Class for OLE document interface"
arch=('any')
url="http://search.cpan.org/dist/OLE-Storage_Lite/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/${_pkgname}-$pkgver.tar.gz")
sha256sums=('e72e055c35bd85ad7c20cf2adb6c89bdbf5725df969484fa6dc981d531ef2c9d')

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
