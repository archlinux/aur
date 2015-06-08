# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Dan Serban
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=a2pdf
pkgver=1.13
pkgrel=5
pkgdesc="Converts ASCII text to PDF format, with optional page/line numbering"
arch=('any')
url="http://search.cpan.org/~jonallen/a2pdf-1.13/"
license=('PerlArtistic')
depends=('perl-switch' 'perl-pdf-api2')
source=(
  "http://search.cpan.org/CPAN/authors/id/J/JO/JONALLEN/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('6a5fd513b89ca1ecd765d701ef84a0cc2408abc49601f5c47737c0dc4c9b7b06')

build() {
  cd "${srcdir}/a2pdf-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/a2pdf-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/a2pdf-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make INSTALLDIRS=vendor DESTDIR="$pkgdir" install
}
